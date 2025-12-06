// WARNING! THIS IS INCOMPLETE

freeslot("SPR_STND", "SPR_WAIT", "SPR_WALK", "SPR_ROLL", "SPR_SPNG",
		 "SPR_RUN_", "SPR_GASP", "SPR_PAIN", "SPR_EDGE", "SPR_DEAD",
		 "SPR_EDGE", "SPR_FALL", "SPR_RIDE")

local spr2enabled = 0 //disable by default

local function spr2toggle2(player, arg)
if not arg or arg == nil
	CONS_Printf(player, "1: Enable WIP SPR2, 0: Disable")
end
if arg == "1"
	spr2enabled = 1
	CONS_Printf(player, "Enabled SPR2, restart the level to apply changes")
end
if arg == "0"
	CONS_Printf(player, "Disabled SPR2, restart the level to apply changes")
end
end
// add a command to toggle it because of how buggy it is
COM_AddCommand("spr2toggle", spr2toggle2)

addHook("ThinkFrame", function()
for player in players.iterate
if spr2enabled == 0
	return
end
if player.mo.state == S_PLAY_STND
	player.mo.sprite = SPR_STND
	player.mo.frame = A
end
if player.mo.state == S_PLAY_TAP1
	player.mo.sprite = SPR_WAIT
	player.mo.frame = A
end
if player.mo.state == S_PLAY_TAP2
	player.mo.sprite = SPR_WAIT
	player.mo.frame = B
end
// note to self: do more animations
end
end)