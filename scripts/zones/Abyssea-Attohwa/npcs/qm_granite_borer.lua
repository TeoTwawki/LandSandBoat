-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_granite_borer (???)
-- Spawns Granite Borer
-- !pos 401.489 19.730 -282.864 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.GRANITE_BORER, { invaderXim.item.WITHERED_COCOON })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.WITHERED_COCOON })
end

return entity
