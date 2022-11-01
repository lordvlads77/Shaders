Shader "Custom/RimIntensity"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        ZWrite Off
        Tags{"Queue" = "Geometry+1000"}
        CGPROGRAM

        #pragma surface surf Lambert

        float4 _Color;

        struct Input
        {
            float3 viewDir;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - dot(IN.viewDir, o.Normal);
          //o.Albedo = float3(dotp, dotp, 1);
            //o.Albedo = float3(rim, 1 + rim, 1 - rim);
            o.Albedo = _Color * rim;
        }
        ENDCG
    }
}
