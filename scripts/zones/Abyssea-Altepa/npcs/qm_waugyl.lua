-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_waugyl (???)
-- Spawns Waugyl
-- !pos -408 1 -299 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.WAUGYL, { invaderXim.item.VIAL_OF_PUPPETS_BLOOD })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.VIAL_OF_PUPPETS_BLOOD })
end

return entity
