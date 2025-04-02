-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_ningishzida (???)
-- Spawns Ningishzida
-- !pos 380 -31 239 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.NINGISHZIDA, { invaderXim.item.MINARUJA_SKULL, invaderXim.item.JACULUS_WING, invaderXim.item.HIGH_QUALITY_WIVRE_HIDE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.MINARUJA_SKULL, invaderXim.item.JACULUS_WING, invaderXim.item.HIGH_QUALITY_WIVRE_HIDE })
end

return entity
