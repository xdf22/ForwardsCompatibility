// spindash animation for 2.1 created by "jadenarc" on gamebanana, modified to work
// with any character with CA2_SPINDASH and to use the normal spindash sprites,
// i was gonna make my own but the dust animation was hard

freeslot("SPR_SPIN", "S_CSTMSPIN1", "S_SPINDUST1", "S_SPINDUST2", "S_SPINDUST3", "S_SPINDUST4", "SPR_DUST", "S_FIREDUST1", "S_FIREDUST2", "S_FIREDUST3", "S_FIREDUST4", "SPR_FPRT", "S_BUBBLEDUST1", "S_BUBBLEDUST2", "S_BUBBLEDUST3", "S_BUBBLEDUST4")

states[S_SPINDUST1] = {SPR_DUST,0,7,nil,0,0,S_SPINDUST2}
states[S_SPINDUST2] = {SPR_DUST,1,6,nil,0,0,S_SPINDUST3}
states[S_SPINDUST3] = {SPR_DUST,2|TR_TRANS30,4,nil,0,0,S_SPINDUST4}
states[S_SPINDUST4] = {SPR_DUST,3|TR_TRANS60,3,nil,0,0,S_NULL}

states[S_FIREDUST1] = {SPR_FPRT,A,7,nil,0,0,S_FIREDUST2}
states[S_FIREDUST2] = {SPR_FPRT,A,6,nil,0,0,S_FIREDUST3}
states[S_FIREDUST3] = {SPR_FPRT,A|TR_TRANS30,4,nil,0,0,S_FIREDUST4}
states[S_FIREDUST4] = {SPR_FPRT,A|TR_TRANS60,3,nil,0,0,S_NULL}

states[S_BUBBLEDUST1] = {SPR_BUBP,A,7,nil,0,0,S_BUBBLEDUST2}
states[S_BUBBLEDUST2] = {SPR_BUBP,A,6,nil,0,0,S_BUBBLEDUST3}
states[S_BUBBLEDUST3] = {SPR_BUBP,A|TR_TRANS30,4,nil,0,0,S_BUBBLEDUST4}
states[S_BUBBLEDUST4] = {SPR_BUBP,A|TR_TRANS60,3,nil,0,0,S_NULL}

states[S_CSTMSPIN1] = {SPR_SPIN, A, 2, nil, 0, 0, S_CSTMSPIN1}

addHook("ThinkFrame", do
	for player in players.iterate do
		if !(player.mo and player.charability2 == CA2_SPINDASH)
			return
		end

		if (player.pflags & PF_STARTDASH)
		and (player.mo.state >= S_PLAY_ATK1 and player.mo.state <= S_PLAY_ATK4) then
			player.mo.state = S_CSTMSPIN1 --Change state
		end
		if not (player.pflags & PF_STARTDASH) and player.mo.state == S_CSTMSPIN1 then
			player.mo.state = S_PLAY_ATK1 
		end

		if (player.mo.state == S_CSTMSPIN1)
		and (player.pflags & PF_STARTDASH) then
			player.panim = PA_ROLL

		if not player.mo.sonicspindashframe
			player.mo.sonicspindashframe = 0
		end

			player.mo.sonicspindashframe = ($1 + FixedDiv(player.dashspeed/90, player.mo.scale)) % (4*FRACUNIT)

			if not (player.mo.eflags & MFE_GOOWATER) then
				for i=(leveltime%7)/2,(leveltime%7) do
					local particle = P_SpawnMobj(player.mo.x, player.mo.y,
						player.mo.z + ((player.mo.eflags & MFE_VERTICALFLIP)/MFE_VERTICALFLIP * (player.mo.height - mobjinfo[MT_PARTICLE].height)),
						MT_PARTICLE)
					if (player.powers[pw_shield] == SH_ELEMENTAL and not (player.mo.eflags & MFE_TOUCHWATER or player.mo.eflags & MFE_UNDERWATER)) then
						particle.state = S_FIREDUST1
						particle.bubble = false
					elseif (player.mo.eflags & MFE_TOUCHWATER or player.mo.eflags & MFE_UNDERWATER) then
						particle.state = S_BUBBLEDUST1
						particle.bubble = true
					else
						particle.state = S_SPINDUST1
						particle.bubble = false
					end
					particle.target = player.mo
					particle.eflags = $1 | (player.mo.eflags & MFE_VERTICALFLIP)
					particle.scale = player.mo.scale*2/3
					P_SetObjectMomZ(particle, player.dashspeed/50+P_RandomByte()<<10, false)
					P_InstaThrust(particle, player.mo.angle+(P_RandomRange(-ANG30/FRACUNIT, ANG30/FRACUNIT)*FRACUNIT), FixedMul(-player.dashspeed/12-1*FRACUNIT-P_RandomByte()<<11, player.mo.scale))
					P_TryMove(particle, particle.x+particle.momx, particle.y+particle.momy, true)
				end
			end
			player.mo.frame = player.mo.sonicspindashframe/FRACUNIT
		end
	end
end)
 
addHook("MobjThinker", function(mo)
	if not (mo.target and mo.target.valid) then return end
	if (mo.state >= S_SPINDUST1 and mo.state < S_FIREDUST1) or (mo.state >= S_FIREDUST1 and mo.state < S_BUBBLEDUST1) or (mo.state >= S_BUBBLEDUST1) then
		mo.momx = FixedMul($1, 50000)
		mo.momy = FixedMul($1, 50000)
		mo.momz = $1+P_MobjFlip(mo)/3
	end
	if (mo.bubble) and (mo.watertop ~= mo.subsector.sector.floorheight - 1000*FRACUNIT) and (mo.z+mo.height >= mo.watertop - 5*FRACUNIT) then
		mo.flags2 = $1|MF2_DONTDRAW
	end
end, MT_PARTICLE)
