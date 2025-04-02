-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Namonutice
-- Fame Checker
-- !zone 230
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(31, player:getFame(invaderXim.fameArea.SANDORIA))
end

return entity
