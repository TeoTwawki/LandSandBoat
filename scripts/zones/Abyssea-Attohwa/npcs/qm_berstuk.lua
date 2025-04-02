-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_berstuk (???)
-- Spawns Berstuk
-- !pos -280.000 -4.000 -38.516 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.BERSTUK, { invaderXim.item.EXTENDED_EYESTALK })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.EXTENDED_EYESTALK })
end

return entity
