-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_tablilla (???)
-- Spawns Tablilla
-- !pos -877 -8 -524 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.TABLILLA, { invaderXim.item.SANDY_SHARD })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.SANDY_SHARD })
end

return entity
