-----------------------------------
-- Area: Ship bound for Mhaura Pirates
--  NPC: Sahn
-- Notes: Tells ship ETA time
-- !pos 0.28 -14.0 -1.411 221
-----------------------------------
local ID = zones[invaderXim.zone.SHIP_BOUND_FOR_MHAURA_PIRATES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.transport.onBoatTimekeeperTrigger(player, invaderXim.transport.routes.SELBINA_MHAURA, ID.text.ON_WAY_TO_MHAURA, ID.text.ARRIVING_SOON_MHAURA)
end

return entity
