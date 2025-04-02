-----------------------------------
-- Area: Castle Oztroja
--  NPC: _475 (Brass Door)
-- Involved in Mission: Magicite
-- !pos -99 24 -105 151
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
