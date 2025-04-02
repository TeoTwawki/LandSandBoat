-----------------------------------
-- Area: Upper Jeuno
--  NPC: Wise Wolf
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:sendMenu(invaderXim.menuType.AUCTION)
end

return entity
