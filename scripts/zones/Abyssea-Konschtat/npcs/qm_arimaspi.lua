-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_arimaspi (???)
-- Spawns Arimaspi
-- !pos 438.000 31.922 358.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.ARIMASPI, { invaderXim.item.CLOUDED_LENS })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.CLOUDED_LENS })
end

return entity
