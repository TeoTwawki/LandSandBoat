-----------------------------------
-- Area: Castle Oztroja
--  NPC: Brass Door
-- Notes: Open by handle (I-8)
-- !pos 20 0.5 -13 151
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
