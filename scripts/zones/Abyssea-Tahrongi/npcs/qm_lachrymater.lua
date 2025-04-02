-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_lachrymater (???)
-- Spawns Lachrymater
-- !pos -220 -1 -299 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.LACHRYMATER, { invaderXim.item.MOANING_VESTIGE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.MOANING_VESTIGE })
end

return entity
