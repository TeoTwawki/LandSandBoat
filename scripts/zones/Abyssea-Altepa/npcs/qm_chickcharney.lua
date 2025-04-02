-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_chickcharney (???)
-- Spawns Chickcharney
-- !pos 36 0 -240 218
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.CHICKCHARNEY, { invaderXim.item.HIGH_QUALITY_COCKATRICE_SKIN  })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.HIGH_QUALITY_COCKATRICE_SKIN  })
end

return entity
