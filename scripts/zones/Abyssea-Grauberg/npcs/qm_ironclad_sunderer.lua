-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_ironclad_sunderer (???)
-- Spawns Ironclad Sunderer
-- !pos 501 25 503 254
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_GRAUBERG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.IRONCLAD_SUNDERER, { invaderXim.item.TEEKESSELCHEN_FRAGMENT, invaderXim.item.DARKFLAME_ARM })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.TEEKESSELCHEN_FRAGMENT, invaderXim.item.DARKFLAME_ARM })
end

return entity
