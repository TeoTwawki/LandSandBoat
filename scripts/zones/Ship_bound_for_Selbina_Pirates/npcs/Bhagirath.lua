-----------------------------------
-- Area: Ship_bound_for_Selbina Pirates
--  NPC: Bhagirath
-- Notes: Tells ship ETA time
-- !pos 0.278 -14.707 -1.411 220
-----------------------------------
local ID = zones[invaderXim.zone.SHIP_BOUND_FOR_SELBINA_PIRATES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.transport.onBoatTimekeeperTrigger(player, invaderXim.transport.routes.SELBINA_MHAURA, ID.text.ON_WAY_TO_SELBINA, ID.text.ARRIVING_SOON_SELBINA)
end

return entity
