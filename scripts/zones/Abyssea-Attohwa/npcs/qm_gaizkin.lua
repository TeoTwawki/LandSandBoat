-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_gaizkin (???)
-- Spawns Gaizkin
-- !pos -132.253 0.015 0.753 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.GAIZKIN, { invaderXim.item.VIAL_OF_UNDYING_OOZE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.VIAL_OF_UNDYING_OOZE })
end

return entity
