Shader "Bassel/Line"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
		_LineColor("Line Color", Color) = (1,1,1,1)
		_Multiplier("Multiplier", Range(0,1000)) = 0.5
		_LineThickness("Line Thickness", Range(0,1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
		Blend SrcAlpha One
		ZWrite Off


        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"


            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
			fixed4 _LineColor;
			float _Multiplier;
			float _LineThickness;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
				float value_Sin = step(abs(sin(i.uv.x * _Multiplier + _Time.w)),_LineThickness);
				float4 col = float4(value_Sin, value_Sin, value_Sin,1);
				//col = float4(sin(i.uv.x) * _Multiplier, sin(i.uv.x) * _Multiplier, sin(i.uv.x) * _Multiplier, 1);
                return col;
            }
            ENDCG
        }
    }
}
