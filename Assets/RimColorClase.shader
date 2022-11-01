Shader "2doParc/RimColorClase"
{
  Properties
  {
    _RimPower("Rim Power", Range(0,5)) = 1
  }
  SubShader
  {
    CGPROGRAM


    #pragma surface surf Lambert
    float4 _RimColor;
    half _RimPower;
    struct Input
    {
      float3 viewDir;
      float3 worldPos;
    };

    void surf(Input IN, inout SurfaceOutput o)
    {
      half rim = 1 - saturate( dot(IN.viewDir, o.Normal));
      o.Emission  = rim > 0.6 ? float3 (1,0,0):
                    rim > 0.4 ? float3 (0,1,0):
                    rim > 0.2 ? float3(0,0,1):
                    rim >  0.1 ? float3 (0,0,0): 0 * _RimPower;
    }
    ENDCG
  }
}
