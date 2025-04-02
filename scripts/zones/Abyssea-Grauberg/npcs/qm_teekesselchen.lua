-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_teekesselchen (???)
-- Spawns Teekesselchen
-- !pos 319 47 643 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.TEEKESSELCHEN, { invaderXim.item.FLASK_OF_BUBBLING_OIL })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.FLASK_OF_BUBBLING_OIL })
end

return entity
