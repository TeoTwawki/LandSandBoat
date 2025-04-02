-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm_alkonost (???)
-- Spawns Alkonost
-- !pos 54.000 30.654 414.000 15
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_KONSCHTAT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.ALKONOST, { invaderXim.item.GIANT_BUGARD_TUSK })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.GIANT_BUGARD_TUSK })
end

return entity
