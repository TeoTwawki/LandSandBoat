-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_kampe (???)
-- Spawns Kampe
-- !pos -401.612 3.738 -200.972 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.KAMPE, { invaderXim.item.GORY_PINCER })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.GORY_PINCER })
end

return entity
