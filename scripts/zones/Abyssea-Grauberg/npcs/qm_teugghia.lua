-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_teugghia (???)
-- Spawns Teugghia
-- !pos -68 -6 656 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.TEUGGHIA, { invaderXim.item.NAIADS_LOCK, invaderXim.item.UNSEELIE_EYE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.NAIADS_LOCK, invaderXim.item.UNSEELIE_EYE })
end

return entity
