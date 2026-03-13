// WARNING! THIS IS INCOMPLETE

freeslot("SPR_STND", "SPR_WAIT", "SPR_WALK", "SPR_ROLL", "SPR_SPNG",
		 "SPR_RUN_", "SPR_GASP", "SPR_PAIN", "SPR_EDGE", "SPR_DEAD",
		 "SPR_EDGE", "SPR_FALL", "SPR_RIDE")

local spr2togglecvar = CV_RegisterVar({
	name = "cv_spr2toggle",
	defaultvalue = "0",
	flags = nil,
	PossibleValue = CV_OnOff
})

addHook("ThinkFrame", function()
for player in players.iterate
if CV_FindVar(cv_spr2toggle).value == 0
	return
end
// Stand
if player.mo.state == S_PLAY_STND
	player.mo.sprite = SPR_STND
	player.mo.frame = A
end
// Waiting
if player.mo.state == S_PLAY_TAP1
	player.mo.sprite = SPR_WAIT
	player.mo.frame = A
end
if player.mo.state == S_PLAY_TAP2
	player.mo.sprite = SPR_WAIT
	player.mo.frame = B
end
// Walking
if player.mo.state == S_PLAY_RUN1
	player.mo.sprite = SPR_WALK
	player.mo.frame = A
end
if player.mo.state == S_PLAY_RUN2
	player.mo.sprite = SPR_WALK
	player.mo.frame = B
end
if player.mo.state == S_PLAY_RUN3
	player.mo.sprite = SPR_WALK
	player.mo.frame = C
end
if player.mo.state == S_PLAY_RUN4
	player.mo.sprite = SPR_WALK
	player.mo.frame = D
end
if player.mo.state == S_PLAY_RUN5
	player.mo.sprite = SPR_WALK
	player.mo.frame = E
end
if player.mo.state == S_PLAY_RUN6
	player.mo.sprite = SPR_WALK
	player.mo.frame = F
end
if player.mo.state == S_PLAY_RUN7
	player.mo.sprite = SPR_WALK
	player.mo.frame = G
end
if player.mo.state == S_PLAY_RUN8
	player.mo.sprite = SPR_WALK
	player.mo.frame = H
end
// Running
if player.mo.state == S_PLAY_SPD1
	player.mo.sprite = SPR_RUN_
	player.mo.frame = A
end
if player.mo.state == S_PLAY_SPD2
	player.mo.sprite = SPR_RUN_
	player.mo.frame = B
end
if player.mo.state == S_PLAY_SPD3
	player.mo.sprite = SPR_RUN_
	player.mo.frame = C
end
if player.mo.state == S_PLAY_SPD4
	player.mo.sprite = SPR_RUN_
	player.mo.frame = D
end
// Rolling
if player.mo.state == S_PLAY_ATK1
	player.mo.sprite = SPR_ROLL
	player.mo.frame = A
end
if player.mo.state == S_PLAY_ATK2
	player.mo.sprite = SPR_ROLL
	player.mo.frame = B
end
if player.mo.state == S_PLAY_ATK3
	player.mo.sprite = SPR_ROLL
	player.mo.frame = C
end
if player.mo.state == S_PLAY_ATK4
	player.mo.sprite = SPR_ROLL
	player.mo.frame = D
end
// Spring
if player.mo.state == S_PLAY_SPRING
	player.mo.sprite = SPR_SPNG
	player.mo.frame = A
end
// Falling
if player.mo.state == S_PLAY_FALL1
	player.mo.sprite = SPR_FALL
	player.mo.frame = A
end
if player.mo.state == S_PLAY_FALL2
	player.mo.sprite = SPR_FALL
	player.mo.frame = B
end
// Gasp
if player.mo.state == S_PLAY_GASP
	player.mo.sprite = SPR_GASP
	player.mo.frame = A
end
// Pain
if player.mo.state == S_PLAY_PAIN
	player.mo.sprite = SPR_PAIN
	player.mo.frame = A
end
// Dead
if player.mo.state == S_PLAY_DIE
	player.mo.sprite = SPR_DEAD
	player.mo.frame = A
end
// Edge Teeter
if player.mo.state == S_PLAY_TEETER1
	player.mo.sprite = SPR_EDGE
	player.mo.frame = A
end
if player.mo.state == S_PLAY_TEETER2
	player.mo.sprite = SPR_EDGE
	player.mo.frame = B
end
// Ride
if player.mo.state == S_PLAY_CARRY
	player.mo.sprite = SPR_RIDE
	player.mo.frame = A
end
// Sign-post
if player.mo.state == S_PLAY_SIGN
	player.mo.sprite = SPR_SIGN
	player.mo.frame = A
end
end
end)
