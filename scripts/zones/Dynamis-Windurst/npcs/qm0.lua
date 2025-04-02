-----------------------------------
-- Area: Dynamis-Windurst
--  NPC: ??? (qm0)
-- Note: Spawns Tzee Xicu Idol / Arch Tzee Xicu Idol
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
