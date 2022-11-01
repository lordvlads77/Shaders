Shader "2Parcial/Alpha"
{
    Properties
    {
      //Aquí declaras las propiedades
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Emission ("Albedo (RGB)(", 2D) = "white" {}
        _Slider("Alpha", Range(0,1)) = 1
    }
    SubShader
    {
        //The more important stuff for the shader goes here
        Tags{"RenderType" = "Transparent"}
        CGPROGRAM
        #pragma surface surf Lambert alpha
        //Here we sample the Texture for future use.
        sampler2D _MainTex;
        sampler2D _Emission;
        float4 _Color;
        half _Slider;
        struct Input
        {
          // Aquí declaramos las UV de la textura.
            float2 uv_MainTex;
        };
        void surf(Input IN, inout SurfaceOutput o)
        {
          // Esto es para que la textura si se vea en el modelo.
          o.Albedo = tex2D (_MainTex, IN.uv_MainTex);
          // Esto es para aplicar tranparencia al shader y el slider es para que funcione en el editor.
          o.Alpha = _Color.a * _Slider;
        }
        ENDCG
    }
      Fallback "Diffuse"
    }
