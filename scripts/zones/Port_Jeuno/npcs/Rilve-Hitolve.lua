-----------------------------------
-- Area: Port Jeuno
--  NPC: Rilve-Hitolve
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:sendMenu(invaderXim.menuType.AUCTION)
end

return entity
