// Author: gre
// License: MIT

#include <metal_stdlib>
#include "MTIShaderLib.h"
#include "MTTransitionLib.h"

using namespace metalpetal;

fragment float4 RandomsquaresFragment(VertexOut vertexIn [[ stage_in ]],
                                      texture2d<float, access::sample> fromTexture [[ texture(0) ]],
                                      texture2d<float, access::sample> toTexture [[ texture(1) ]],
                                      constant float & smoothness [[ buffer(0) ]],
                                      constant float2 & size [[ buffer(1) ]],
                                      constant float & ratio [[ buffer(2) ]],
                                      constant float & progress [[ buffer(3) ]],
                                      sampler textureSampler [[ sampler(0) ]])
{
    float2 uv = vertexIn.textureCoordinate;
    float _fromR = fromTexture.get_width()/fromTexture.get_height();
    float _toR = toTexture.get_width()/toTexture.get_height();
    
    float r = rand(floor(float2(size) * uv));
    float m = smoothstep(0.0, -smoothness, r - (progress * (1.0 + smoothness)));
    return mix(
               getFromColor(uv, fromTexture, ratio, _fromR),
               getToColor(uv, toTexture, ratio, _toR),
               m);
    
}
