-----------------------------------
-- Area: Castle Oztroja
--  NPC: _m71 (Torch Stand)
-- Involved in Mission: Magicite
-- !pos -99 24 -105 151
-----------------------------------
local ID = zones[invaderXim.zone.CASTLE_OZTROJA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(invaderXim.ki.YAGUDO_TORCH) then
        player:startEvent(11)
    else
        player:messageSpecial(ID.text.PROBABLY_WORKS_WITH_SOMETHING_ELSE)
    end
end

return entity
