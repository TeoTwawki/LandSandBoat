-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_bugul_noz (???)
-- Spawns Bugul Noz
-- !pos -608 -1 -397 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.BUGUL_NOZ, { invaderXim.item.HANDFUL_OF_SABULOUS_CLAY })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.HANDFUL_OF_SABULOUS_CLAY })
end

return entity
