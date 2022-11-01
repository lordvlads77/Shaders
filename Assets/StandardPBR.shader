Shader "3erParc/StandardPBR"
{
  Properties
  {
    _Color("Color", Color) = (1,1,1,1)
    _MetallicTex ("Metallic", 2D) = "white" {}
    _Metallic ("Metallic", Range(0.0, 1.0)) = 0.0
  }
    SubShader
    {
      Tags
      {
        "Queue" = "Geometry"
      }

      CGPROGRAM
      #pragma surface surf Standard //Añadir Specular para hacerlo StandarSpec

      sampler2D _MetallicTex;
      half _Metallic;
      fixed4 _Color;

      struct Input
      {
        float2 uv_MetallicTex;
      };

      void surf(Input IN, inout SurfaceOutputStandard o) //Añadir Specular para hacer StandardSpec)
      {
        o.Albedo = _Color.rgb;
        o.Metallic = tex2D (_MetallicTex, IN.uv_MetallicTex);
        o.Smoothness = _Metallic;
      }
      ENDCG
    }
    FallBack "Diffuse"
}
