-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_nightshade (???)
-- Spawns Nightshade
-- !pos 410.304 19.500 13.227 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.NIGHTSHADE, { invaderXim.item.WITHERED_BUD })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.WITHERED_BUD })
end

return entity
