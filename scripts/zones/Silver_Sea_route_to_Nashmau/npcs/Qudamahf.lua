-----------------------------------
-- Area: Silver_Sea_route_to_Nashmau
--  NPC: Qudamahf
-- Notes: Tells ship ETA time
-- !pos 0.340 -12.232 -4.120 58
-----------------------------------
local ID = zones[invaderXim.zone.SILVER_SEA_ROUTE_TO_NASHMAU]
-----------------------------------
---@type TNpcEntity
local entity = {}

local messages =
{
    [invaderXim.transport.message.NEARING] = ID.text.NEARING_NASHMAU,
    [invaderXim.transport.message.DOCKING] = ID.text.DOCKING_IN_NASHMAU
}

entity.onSpawn = function(npc)
    npc:addPeriodicTrigger(invaderXim.transport.message.NEARING, invaderXim.transport.messageTime.SILVER_SEA, invaderXim.transport.epochOffset.NEARING)
    npc:addPeriodicTrigger(invaderXim.transport.message.DOCKING, invaderXim.transport.messageTime.SILVER_SEA, invaderXim.transport.epochOffset.DOCKING)
end

entity.onTimeTrigger = function(npc, triggerID)
    invaderXim.transport.captainMessage(npc, triggerID, messages)
end

entity.onTrigger = function(player, npc)
    invaderXim.transport.onBoatTimekeeperTrigger(player, invaderXim.transport.routes.SILVER_SEA, ID.text.ON_WAY_TO_NASHMAU, ID.text.ARRIVING_SOON_NASHMAU)
end

return entity
