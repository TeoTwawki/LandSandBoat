-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_fear_gorta (???)
-- Spawns Fear Gorta
-- !pos 630.000 33.608 410.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.FEAR_GORTA, { invaderXim.item.SQUARE_OF_MOONGLOW_CLOTH })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.SQUARE_OF_MOONGLOW_CLOTH })
end

return entity
