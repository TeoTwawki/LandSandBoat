-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_grandgousier (???)
-- Spawns Grandgousier
-- !pos -398 .010 -322 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.GRANDGOUSIER, { invaderXim.item.MASSIVE_ARMBAND })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.MASSIVE_ARMBAND })
end

return entity
