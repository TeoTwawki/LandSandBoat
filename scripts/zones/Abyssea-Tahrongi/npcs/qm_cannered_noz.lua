-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_cannered_noz (???)
-- Spawns Cannered Noz
-- !pos -355 4 251 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.CANNERED_NOZ, { invaderXim.item.BALEFUL_SKULL })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.BALEFUL_SKULL })
end

return entity
