-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_alectryon (???)
-- Spawns Alectryon
-- !pos -42 -8 34 45
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_TAHRONGI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.ALECTRYON, { invaderXim.item.CHUNK_OF_COCKATRICE_TAILMEAT, invaderXim.item.QUIVERING_EFT_EGG })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.CHUNK_OF_COCKATRICE_TAILMEAT, invaderXim.item.QUIVERING_EFT_EGG })
end

return entity
