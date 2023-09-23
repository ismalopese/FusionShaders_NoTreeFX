//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   sampler2D DiffuseSampler;
//   sampler2D DiffuseSamplerPhase2;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   DiffuseSampler       s0       1
//   DiffuseSamplerPhase2 s1       1
//

    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 10, 0, 0, 0
    dcl_color v0
    dcl_texcoord v1.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    add r0.xy, c0, v1
    texld r0, r0, s1
    mul r0, r0, v0
    texld r1, v1, s0
    mul r1, r1, v0
    cmp oC0, v1.x, r1, r0
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	if_ne v9.y, c127.y
		rcp r20.z, c128.x
		mul r20.x, v9.w, r20.z
		mul r20.y, c128.y, r20.z
		log r20.x, r20.x
		log r20.y, r20.y
		rcp r20.y, r20.y
	else
		mov r20.x, v9.z
		rcp r20.y, v9.w
	endif
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 6 instruction slots used (2 texture, 4 arithmetic)