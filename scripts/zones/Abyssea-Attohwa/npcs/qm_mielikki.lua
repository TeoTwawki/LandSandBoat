-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_mielikki (???)
-- Spawns Mielikki
-- !pos 481.096 20.000 39.549 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.MIELIKKI, { invaderXim.item.GREAT_ROOT })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.GREAT_ROOT })
end

return entity
