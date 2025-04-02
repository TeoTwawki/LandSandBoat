-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_lentor (???)
-- Spawns Lentor
-- !pos -248.000 47.971 403.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.LENTOR, { invaderXim.item.GIANT_SLUG_EYESTALK })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.GIANT_SLUG_EYESTALK })
end

return entity
