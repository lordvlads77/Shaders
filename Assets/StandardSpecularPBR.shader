Shader "3erParc/StandardSpecularPBR"
{
  Properties
  {
    _Color("Color", Color) = (1,1,1,1)
    _MetallicTex ("Metallic", 2D) = "white" {}
    _Metallic ("Metallic", Range(0.0, 1.0)) = 0.0
    _ColorSp ("Specular", Color) = (1,1,1,1)
  }
    SubShader
    {
      Tags
      {
        "Queue" = "Geometry"
      }

      CGPROGRAM
      #pragma surface surf StandardSpecular //Añadir Specular para hacerlo StandarSpec

      sampler2D _MetallicTex;
      half _Metallic;
      fixed4 _Color;
      float4 _ColorSp;

      struct Input
      {
        float2 uv_MetallicTex;
      };

      void surf(Input IN, inout SurfaceOutputStandardSpecular o) //Añadir Specular para hacer StandardSpec)
      {
        o.Albedo = _Color.rgb;
        o.Specular = tex2D (_MetallicTex, IN.uv_MetallicTex) * _ColorSp;
        o.Smoothness = _Metallic;
      }
      ENDCG
    }
    FallBack "Diffuse"
}
