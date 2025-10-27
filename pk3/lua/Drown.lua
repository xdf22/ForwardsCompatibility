// add a drown animation

freeslot("SPR_DRWN", "S_PLAY_DRWN")

states[S_PLAY_DRWN] = {
SPR_DRWN,
A,
-1
}
 
addHook("ThinkFrame", function()
for player in players.iterate
if player.mo
	and (player.mo.state == S_PLAY_DIE)
	and (player.mo.eflags & MFE_UNDERWATER)
	and player.powers[pw_underwater] <= 0)
		player.mo.state = S_PLAY_DRWN
end
end
end)