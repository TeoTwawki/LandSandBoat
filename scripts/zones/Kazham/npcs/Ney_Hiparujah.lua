-----------------------------------
-- Area: Kazham
--  NPC: Ney Hiparujah
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(251 + player:getFameLevel(invaderXim.fameArea.WINDURST))
end

return entity
