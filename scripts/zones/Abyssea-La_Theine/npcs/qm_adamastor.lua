-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_adamastor (???)
-- Spawns Adamastor
-- !pos -716 15 639 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.ADAMASTOR, { invaderXim.item.TROPHY_SHIELD })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.TROPHY_SHIELD })
end

return entity
