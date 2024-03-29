#include "Packages/jp.keijiro.noiseshader/Shader/SimplexNoise2D.hlsl"

void WavePattern_float
  (float2 Pos, float Freq, float Thresh,
   float Time, float Seed, float3 Color,
   out float3 outColor)
{
    float y = Pos.y * Freq * 10;
    float t = Time * 0.6 + Pos.x * 0.04 + Seed;
    float n1 = SimplexNoise(float2(y * 1, t + 100));
    float n2 = SimplexNoise(float2(y * 2, t + 200));
    float n3 = SimplexNoise(float2(y * 4, t + 300));
    float r = ConstructFloat(JenkinsHash(float2(Pos.x * 256, Time * 100)));
    float a = n1 + n2 * 0.5 + n3 * 0.25 + r * 0.1;
    outColor = Color * smoothstep(Thresh, Thresh + 0.01, a);
}
