-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_ashtaerh (???)
-- Spawns Ashtaerh the Gallvexed
-- !pos 360.000 -16.043 -400.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.ASHTAERH_THE_GALLVEXED, { invaderXim.item.MURMURING_GLOBULE })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.MURMURING_GLOBULE })
end

return entity
