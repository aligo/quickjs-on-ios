//
//  test.m
//  quicKjSruntimE
//
//  Created by aligo Kang on 2019/7/13.
//  Copyright © 2019 aligo Kang. All rights reserved.
//

#include "test.h"

void testRun()
{
    JSRuntime *rt;
    JSContext *ctx;
    rt = JS_NewRuntime();
    ctx = JS_NewContext(rt);
    JS_SetModuleLoaderFunc(rt, NULL, js_module_loader, NULL);
    
    char *expr = "!function(r){var e={};function n(t){if(e[t])return e[t].exports;var o=e[t]={i:t,l:!1,exports:{}};return r[t].call(o.exports,o,o.exports,n),o.l=!0,o.exports}n.m=r,n.c=e,n.d=function(r,e,t){n.o(r,e)||Object.defineProperty(r,e,{enumerable:!0,get:t})},n.r=function(r){\"undefined\"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(r,Symbol.toStringTag,{value:\"Module\"}),Object.defineProperty(r,\"__esModule\",{value:!0})},n.t=function(r,e){if(1&e&&(r=n(r)),8&e)return r;if(4&e&&\"object\"==typeof r&&r&&r.__esModule)return r;var t=Object.create(null);if(n.r(t),Object.defineProperty(t,\"default\",{enumerable:!0,value:r}),2&e&&\"string\"!=typeof r)for(var o in r)n.d(t,o,function(e){return r[e]}.bind(null,o));return t},n.n=function(r){var e=r&&r.__esModule?function(){return r.default}:function(){return r};return n.d(e,\"a\",e),e},n.o=function(r,e){return Object.prototype.hasOwnProperty.call(r,e)},n.p=\"/dist/\",n(n.s=1)}([,function(r,e){var n={new:function(r){for(var e=new Array(r),n=0;n<r;n++)e[n]=new Float64Array(r);return e},T:function(r,e){for(var t=n.new(e),o=0;o<e;o++)for(var u=0;u<e;u++)t[o][u]=r[u][o];return t},mul:function(r,e,t){for(var o=n.new(t),u=n.T(e,t),f=0;f<t;f++)for(var a=0;a<t;a++){for(var i=0,l=0;l<t;l++)i+=r[f][l]*u[a][l];o[f][a]=i}return o}};matgen=function(r){for(var e=n.new(r),t=1/r/r,o=0;o<r;o++)for(var u=0;u<r;u++)e[o][u]=t*(o-u)*(o+u);return e};var t=1500,o=((new Date).getTime(),matgen(t)),u=matgen(t);n.mul(o,u,t)[750][750]}]);";
    
    JSValue ret;
    ret = JS_Eval(ctx, expr, strlen(expr), "<ios>", 0);
    
    NSLog(@"%s", JS_ToCString(ctx, ret));
    JS_FreeValue(ctx, ret);
//    js_std_loop(ctx);
}
