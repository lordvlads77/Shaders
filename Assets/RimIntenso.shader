Shader "2doParc/RimIntenso"
{
  Properties
  {
    //Aqui se declara el poder del rim con el rango pa que funcione el slider.
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
      //Esto es para multiplicar el rim con el frac y crear ese efecto intenso.
      o.Emission = frac(rim * 10 * _RimPower);
    }
    ENDCG
  }
}
