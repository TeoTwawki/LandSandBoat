-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_blazing_eruca (???)
-- Spawns Blazing Eruca
-- !pos 233.162 19.720 -243.255 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.BLAZING_ERUCA, { invaderXim.item.ERUCA_EGG })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.ERUCA_EGG })
end

return entity
