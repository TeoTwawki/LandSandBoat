-----------------------------------
-- Area: Castle Oztroja
--  NPC: _477 (Brass Door)
-- Notes: Open by 4 torch stands
-- !pos -100 -71 -49 151
-----------------------------------
local ID = zones[invaderXim.zone.CASTLE_OZTROJA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if npc:getAnimation() == invaderXim.anim.CLOSE_DOOR then
        player:messageSpecial(ID.text.ITS_LOCKED)
    end
end

return entity
