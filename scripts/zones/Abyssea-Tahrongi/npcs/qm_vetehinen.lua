-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_vetehinen (???)
-- Spawns Vetehinen
-- !pos 74 .001 -435 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.VETEHINEN, { invaderXim.item.HIGH_QUALITY_LIMULE_PINCER })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.HIGH_QUALITY_LIMULE_PINCER })
end

return entity
