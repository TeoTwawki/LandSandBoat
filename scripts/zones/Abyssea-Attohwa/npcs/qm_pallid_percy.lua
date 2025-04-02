-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_pallid_percy (???)
-- Spawns Pallid Percy
-- !pos 281.063 20.376 174.011 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.PALLID_PERCY, { invaderXim.item.VIAL_OF_UNDYING_OOZE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.VIAL_OF_UNDYING_OOZE })
end

return entity
