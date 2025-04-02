-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_lugarhoo (???)
-- Spawns Lugarhoo
-- !pos -85 24 -513 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.LUGARHOO, { invaderXim.item.FILTHY_GNOLE_CLAW })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.FILTHY_GNOLE_CLAW })
end

return entity
