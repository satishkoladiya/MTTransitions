// Author: gre
// License: MIT

#include <metal_stdlib>
#include "MTIShaderLib.h"
#include "MTTransitionLib.h"

using namespace metalpetal;

fragment float4 WindFragment(VertexOut vertexIn [[ stage_in ]],
                texture2d<float, access::sample> fromTexture [[ texture(0) ]],
                texture2d<float, access::sample> toTexture [[ texture(1) ]],
                constant float & size [[ buffer(0) ]],
                constant float & ratio [[ buffer(1) ]],
                constant float & progress [[ buffer(2) ]],
                sampler textureSampler [[ sampler(0) ]]) 
{
    float2 uv = vertexIn.textureCoordinate;
    float _fromR = fromTexture.get_width()/fromTexture.get_height();
    float _toR = toTexture.get_width()/toTexture.get_height();
    float r = rand(float2(0, uv.y));
    float m = smoothstep(0.0, -size, uv.x*(1.0-size) + size*r - (progress * (1.0 + size)));
    return mix(
               getFromColor(uv, fromTexture, ratio, _fromR),
               getFromColor(uv, toTexture, ratio, _toR),
               m);
}

