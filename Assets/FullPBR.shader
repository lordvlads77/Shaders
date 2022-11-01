Shader "3erParc/FullPBR"
{
  Properties
  {
    _MetallicTex ("Metallic Tex", 2D) = "white" {}
    _Metallic ("Metallic", Range(0.0, 1.0)) = 0.0
    _Occlusion ("Occlusion Strength", Range(0, 1)) = 0
    _OcclusionTex ("Ambient Oclussion", 2D) = "white" {}
    _SmoothnessTex ("Smoothness Tex", 2D) = "white" {}
    _MainTexture ("Texture", 2D) = "white" {}
    _BumpMap ("Normal Tex", 2D) = "bump" {}
  }
    SubShader
    {
      Tags
      {
        "Queue" = "Geometry"
      }

      CGPROGRAM
      #pragma surface surf Standard //Añadir Specular para hacerlo StandarSpec

      #pragma target 3.0

      sampler2D _MetallicTex;
      half _Metallic;
      half _Occlusion;
      sampler2D _OcclusionTex;
      sampler2D _SmoothnessTex;
      sampler2D _MainTexture;
      sampler2D _BumpMap;

      struct Input
      {
        float2 uv_MetallicTex;
        float2 uv_OcclusionTex;
        float2 uv_SmoothnessTex;
        float2 uv_MainTex;
        float2 uv_BumpMap;
      };

      void surf(Input IN, inout SurfaceOutputStandard o) //Añadir Specular para hacer StandardSpec)
      {
        o.Metallic = tex2D (_MetallicTex, IN.uv_MetallicTex) * _Metallic;
        o.Smoothness = _Metallic;
        o.Occlusion = tex2D (_OcclusionTex, IN.uv_OcclusionTex) * _Occlusion;
        o.Smoothness = tex2D (_SmoothnessTex, IN.uv_SmoothnessTex);
        o.Albedo = tex2D (_MainTexture, IN.uv_MainTex);
        o.Normal = UnpackNormal (tex2D (_BumpMap,IN.uv_BumpMap));
      }
      ENDCG
    }
    FallBack "Diffuse"
}
