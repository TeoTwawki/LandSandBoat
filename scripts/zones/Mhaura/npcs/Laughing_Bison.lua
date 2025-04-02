-----------------------------------
-- Area: Mhaura
--  NPC: Laughing_Bison
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.transport.onDockTimekeeperTrigger(player, npc)
end

return entity
