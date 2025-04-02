-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_keratyrannos (???)
-- Spawns Keratyrannos
-- !pos -134.000 47.371 416.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.KERATYRANNOS, { invaderXim.item.ARMORED_DRAGONHORN })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.ARMORED_DRAGONHORN })
end

return entity
