-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_hexenpilz (???)
-- Spawns Hexenpilz
-- !pos -182.000 2.858 32.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.HEXENPILZ, { invaderXim.item.OBLIVISPORE_MUSHROOM })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.OBLIVISPORE_MUSHROOM })
end

return entity
