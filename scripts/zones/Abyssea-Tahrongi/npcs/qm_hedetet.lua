-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_hedetet (???)
-- Spawns Hedetet
-- !pos -279 7 126 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.HEDETET, { invaderXim.item.VENOMOUS_SCORPION_STINGER, invaderXim.item.CLUMP_OF_ACIDIC_HUMUS })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.VENOMOUS_SCORPION_STINGER, invaderXim.item.CLUMP_OF_ACIDIC_HUMUS })
end

return entity
