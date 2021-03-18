using System;
using System.Collections.Generic;
using UnityEditor.Rendering;
using UnityEditor.Rendering.Universal;
using UnityEngine;

public sealed class MuppetsConverter : RenderPipelineConverter
{
    public override string name => "Muppets";
    public override string info => "Need to update all my Muppets";
    public override string category { get; }
    public override Type conversion => typeof(BuiltInToURPConversion);

    List<string> m_AssetsToConvert = new List<string>();

    public override void OnInitialize(InitializeConverterContext ctx)
    {
        for (int i = 0; i < 10; i++)
        {
            ConverterItemInfo info = new ConverterItemInfo()
            {
                name = "Muppet : " + i,
                path = "Somewhere/On/My/Disk..." + i,
                initialInfo = "",
                helpLink = "?? yupp",
                id = i
            };
            ctx.AddAssetToConvert(info);
            m_AssetsToConvert.Add(info.path);
        }
    }

    public override void OnRun(RunConverterContext ctx)
    {
        foreach (var item in ctx.items)
        {
            var path = m_AssetsToConvert[item.id];
        }
    }
}
