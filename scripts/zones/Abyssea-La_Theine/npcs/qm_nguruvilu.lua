-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_nguruvilu (???)
-- Spawns Nguruvilu
-- !pos 311 23 -524 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.NGURUVILU, { invaderXim.item.WINTER_PUK_EGG })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.WINTER_PUK_EGG })
end

return entity
