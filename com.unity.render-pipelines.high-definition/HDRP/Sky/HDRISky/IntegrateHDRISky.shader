Shader "Hidden/HDRenderPipeline/IntegrateHDRI"
{
    Properties
    {
        [HideInInspector]
        _Cubemap ("", CUBE) = "white" {}
        _InvOmegaP ("", Float) = 0
    }

    SubShader
    {
        Tags{ "RenderPipeline" = "HDRenderPipeline" }
        Pass
        {
            ZTest Always Cull Off ZWrite Off

            HLSLPROGRAM
            #pragma vertex Vert
            #pragma fragment Frag
            #pragma target 4.5
            #pragma only_renderers d3d11 ps4 xboxone vulkan metal switch

            #include "CoreRP/ShaderLibrary/Common.hlsl"
            #include "CoreRP/ShaderLibrary/Color.hlsl"
            #include "CoreRP/ShaderLibrary/ImageBasedLighting.hlsl"
            #include "../../ShaderVariables.hlsl"

            struct Attributes
            {
                uint vertexID : SV_VertexID;
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
                float2 texCoord   : TEXCOORD0;
            };

            TextureCube<float4> _Cubemap;
            float _InvOmegaP;

            Varyings Vert(Attributes input)
            {
                Varyings output;

                output.positionCS = GetFullScreenTriangleVertexPosition(input.vertexID);
                output.texCoord   = GetFullScreenTriangleTexCoord(input.vertexID);

                return output;
            }
            

            // Spherical integration of the upper hemisphere
            real GetUpperHemisphereLuxValue(TEXTURECUBE_ARGS(skybox, sampler_skybox), real3 N)
            {
                float sum = 0.0;
                float dphi = 0.005;
                float dtheta = 0.005;
                for (float phi = 0; phi < 2.0 * PI; phi += dphi)
                {
                    for (float theta = 0; theta < PI / 2.0; theta += dtheta)
                    {
                        float3 L = TransformGLtoDX(SphericalToCartesian(phi, cos(theta)));
                        real val = Luminance(SAMPLE_TEXTURECUBE_LOD(skybox, sampler_skybox, L, 0).rgb);
                        sum += cos(theta) * sin(theta) * val;
                    }
                }
                sum *= dphi * dtheta;
                return sum;
            }

            float4 Frag(Varyings input) : SV_Target
            {
                float3 N = float3(0.0, 1.0, 0.0);

                float intensity = GetUpperHemisphereLuxValue(TEXTURECUBE_PARAM(_Cubemap, s_trilinear_clamp_sampler), N);

                return float4(intensity, 1.0, 1.0, 1.0);
            }

            ENDHLSL
        }
    }
    Fallback Off
}