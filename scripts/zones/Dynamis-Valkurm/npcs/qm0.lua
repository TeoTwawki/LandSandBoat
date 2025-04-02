-----------------------------------
-- Area: Dynamis-Valkurm
--  NPC: ??? (qm0)
-- Note: Spawns Cirrate Christelle / Arch Christelle
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
