#include "Packages/jp.keijiro.noiseshader/Shader/SimplexNoise2D.hlsl"

void WavePattern_float(float2 Pos, float Time, out float outAlpha)
{
    float t = Time * 0.6 + Pos.x * 0.04;
    float n1 = SimplexNoise(float2(Pos.y * 10, t + 100));
    float n2 = SimplexNoise(float2(Pos.y * 20, t + 200)) * 0.5;
    float n3 = SimplexNoise(float2(Pos.y * 40, t + 300)) * 0.25;
    float r = ConstructFloat(JenkinsHash(float2(Pos.x * 256, Time * 100)));
    outAlpha = smoothstep(1, 1.1, n1 + n2 + n3 + r * 0.1);
}
