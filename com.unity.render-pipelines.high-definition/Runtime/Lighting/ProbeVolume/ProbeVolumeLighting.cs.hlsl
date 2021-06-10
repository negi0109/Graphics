//
// This file was automatically generated. Please don't edit by hand. Execute Editor command [ Edit / Render Pipeline / Generate Shader Includes ] instead
//

#ifndef PROBEVOLUMELIGHTING_CS_HLSL
#define PROBEVOLUMELIGHTING_CS_HLSL
//
// UnityEngine.Rendering.HighDefinition.LeakMitigationMode:  static fields
//
#define LEAKMITIGATIONMODE_NORMAL_BIAS (0)
#define LEAKMITIGATIONMODE_GEOMETRIC_FILTER (1)
#define LEAKMITIGATIONMODE_PROBE_VALIDITY_FILTER (2)
#define LEAKMITIGATIONMODE_OCTAHEDRAL_DEPTH_OCCLUSION_FILTER (3)

// Generated from UnityEngine.Rendering.HighDefinition.ProbeVolumeEngineData
// PackingRules = Exact
struct ProbeVolumeEngineData
{
    float3 debugColor;
    float weight;
    float3 rcpPosFaceFade;
    float rcpDistFadeLen;
    float3 rcpNegFaceFade;
    float endTimesRcpDistFadeLen;
    float3 scale;
    float padding0;
    float3 bias;
    int volumeBlendMode;
    float4 octahedralDepthScaleBias;
    float3 resolution;
    uint lightLayers;
    float3 resolutionInverse;
    float normalBiasWS;
    float viewBiasWS;
    float3 padding1;
};

//
// Accessors for UnityEngine.Rendering.HighDefinition.ProbeVolumeEngineData
//
float3 GetDebugColor(ProbeVolumeEngineData value)
{
    return value.debugColor;
}
float GetWeight(ProbeVolumeEngineData value)
{
    return value.weight;
}
float3 GetRcpPosFaceFade(ProbeVolumeEngineData value)
{
    return value.rcpPosFaceFade;
}
float GetRcpDistFadeLen(ProbeVolumeEngineData value)
{
    return value.rcpDistFadeLen;
}
float3 GetRcpNegFaceFade(ProbeVolumeEngineData value)
{
    return value.rcpNegFaceFade;
}
float GetEndTimesRcpDistFadeLen(ProbeVolumeEngineData value)
{
    return value.endTimesRcpDistFadeLen;
}
float3 GetScale(ProbeVolumeEngineData value)
{
    return value.scale;
}
int GetPadding0(ProbeVolumeEngineData value)
{
    return value.padding0;
}
float3 GetBias(ProbeVolumeEngineData value)
{
    return value.bias;
}
int GetVolumeBlendMode(ProbeVolumeEngineData value)
{
    return value.volumeBlendMode;
}
float4 GetOctahedralDepthScaleBias(ProbeVolumeEngineData value)
{
    return value.octahedralDepthScaleBias;
}
float3 GetResolution(ProbeVolumeEngineData value)
{
    return value.resolution;
}
uint GetLightLayers(ProbeVolumeEngineData value)
{
    return value.lightLayers;
}
float3 GetResolutionInverse(ProbeVolumeEngineData value)
{
    return value.resolutionInverse;
}
float GetNormalBiasWS(ProbeVolumeEngineData value)
{
    return value.normalBiasWS;
}
float GetViewBiasWS(ProbeVolumeEngineData value)
{
    return value.viewBiasWS;
}
float3 GetPadding1(ProbeVolumeEngineData value)
{
    return value.padding1;
}

#endif
