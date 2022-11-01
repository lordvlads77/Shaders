Shader "2doParc/RimToon"
{
  Properties
  {

  }
  SubShader
  {
    CGPROGRAMS


    #pragma surface surf Lambert
    float4 _RimColor;
    half _RimPower;
    struct Input
    {
      float3 viewDir;
      //Aqui se hace referencia a la posicion del Mundo
      float3 worldPos;
    };

    void surf(Input IN, inout SurfaceOutput o)
    {
      half rim = 1 - saturate( dot(IN.viewDir, o.Normal));
      // Aqui dice la condición (?) que si el rim es mayor a 0.9 se aplique lo que dice el float
      o.Emission  = rim > 0.9 ? float3 (0,1,1):0;
    }
    ENDCG
  }
}
