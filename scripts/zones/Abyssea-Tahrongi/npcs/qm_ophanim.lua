-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_ophanim (???)
-- Spawns Ophanim
-- !pos -195 -16 -165 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.OPHANIM, { invaderXim.item.SHRIVELED_WING, invaderXim.item.TARNISHED_PINCER, invaderXim.item.BLOODSHOT_HECTEYE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.SHRIVELED_WING, invaderXim.item.TARNISHED_PINCER, invaderXim.item.BLOODSHOT_HECTEYE })
end

return entity
