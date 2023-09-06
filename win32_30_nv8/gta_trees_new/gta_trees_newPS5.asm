// Removed near shadow stipple + increased vegetation alpha (shadow)
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D StippleTexture;
//   sampler2D TextureSampler;
//   float4 globalScalars;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   globalScalars  c39      1
//   TextureSampler s0       1
//   StippleTexture s10      1
//

    ps_3_0
    def c0, 3.99600005, 4, 0.125, 0.25
    def c1, 0, -1, -0, 0
	def c100, 1.2, 0.5, 1, 0	// x = shadow alpha multiplier
    dcl_texcoord v0.xyz
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s10
    texld r0, v0.yzzw, s0
	mul_sat r0.w, r0.w, c100.x
    mul r0.x, r0.w, c39.x
	mov r20.x, c39.x
	add r20.y, -r0.x, c100.y
	if_ge r20.x, c100.z
		cmp r1, r20.y, c1.y, c1.z
		texkill r1
	else
		mov_sat r0.y, r0.x
		mul r0.y, r0.y, c0.x
		frc r0.z, r0.y
		mul r0.w, r0.z, c0.y
		frc r1.x, r0.w
		add r1.x, r0.w, -r1.x
		add r1.y, r0.y, -r0.z
		mul r0.yz, c0.z, vPos.xxyw
		frc r0.yz, r0_abs
		cmp r0.yz, vPos.xxyw, r0, -r0
		mul r0.yz, r0, c0.w
		mad r1.xy, r1, c0.w, r0.yzzw
		mov r1.zw, c1.x
		texldl r1, r1, s10
		cmp r1, -r1.y, c1.y, c1.z
		texkill r1
	endif
    mov oC0.xyz, v0.x
    mov oC0.w, r0.x

// approximately 21 instruction slots used (3 texture, 18 arithmetic)
