//draw the life icons (XTRAA0) above the "?" or 2.1 sonic's icon, idrk how else to do this lmao
local function dothelifeicon(v)
// only when the lives huditem is enabled that it draws it
if hud.enabled("lives")

for player in players.iterate
	local LIFE = v.cachePatch("XTRAA0")
	v.drawScaled((-16*FRACUNIT), (184*FRACUNIT), 32768, LIFE)
	// todo: use the skincolor
end

end
end

hud.add(dothelifeicon, "game")