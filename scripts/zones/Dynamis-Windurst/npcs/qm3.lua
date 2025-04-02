-----------------------------------
-- Area: Dynamis-Windurst
--  NPC: ??? (qm3)
-- Note: Spawns Naa Yixo the Stillrage
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.dynamis.qmOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.dynamis.qmOnTrigger(player, npc)
end

return entity
