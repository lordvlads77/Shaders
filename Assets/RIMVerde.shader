Shader "2Parcial/RimVerde"
{
    Properties
    {
      //Aqui se declara el color, la parte verde puede ser de cualquier color los 1 es por rgba.
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        ZWrite Off
        Tags{"Queue" = "Geometry+1000"}
        CGPROGRAM

        #pragma surface surf Lambert

        // Aqui se declara el la var color para usarla en el futuro.
        float4 _Color;

        struct Input
        {
            float3 viewDir;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
          // Aquí sigue siendo el producto punto pero más como rim
            half rim = 1 - dot(IN.viewDir, o.Normal);
          // aqui aplicas el rim al albedo.
            o.Albedo = float3(0, rim, 0);
        }
        ENDCG
    }
}
