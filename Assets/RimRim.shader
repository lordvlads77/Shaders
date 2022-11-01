Shader "2doParc/RimRim"
{
  Properties
  {

  }
  SubShader
  {
    CGPROGRAM


    #pragma surface surf Lambert
    //Esto es para el Color del Rim
    float4 _RimColor;
    // Esto es para la Intensidad del Rim
    half _RimPower;
    struct Input
    {
      float3 viewDir;
      float3 worldPos;
    };

    void surf(Input IN, inout SurfaceOutput o)
    {
      // Esto es para restarle 1 al rim y luego saturar el DotProduct
      half rim = 1 - saturate( dot(IN.viewDir, o.Normal));
      o.Emission  = rim;
    }
    ENDCG
  }
}
