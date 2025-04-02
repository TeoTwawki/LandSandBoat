-----------------------------------
-- Area: Selbina
--  NPC: Humilitie
-- Reports the time remaining before boat arrival.
-- !pos 17.979 -2.39 -58.800 248
-----------------------------------
local ID = zones[invaderXim.zone.SELBINA]
-----------------------------------
---@type TNpcEntity
local entity = {}

local messages =
{
    [invaderXim.transport.trigger.selbina.FERRY_ARRIVING_FROM_MHAURA] = ID.text.FERRY_ARRIVING,
    [invaderXim.transport.trigger.selbina.FERRY_DEPARTING_TO_MHAURA]  = ID.text.FERRY_DEPARTING
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:addPeriodicTrigger(invaderXim.transport.trigger.selbina.FERRY_ARRIVING_FROM_MHAURA,
        invaderXim.transport.interval.selbina.FROM_TO_MHAURA,
        invaderXim.transport.offset.selbina.FERRY_ARRIVING_FROM_MHAURA)
    npc:addPeriodicTrigger(invaderXim.transport.trigger.selbina.FERRY_DEPARTING_TO_MHAURA,
        invaderXim.transport.interval.selbina.FROM_TO_MHAURA,
        invaderXim.transport.offset.selbina.FERRY_DEPARTING_TO_MHAURA)
end

entity.onTimeTrigger = function(npc, triggerID)
    invaderXim.transport.dockMessage(npc, triggerID, messages, 'selbina')
end

entity.onTrigger = function(player, npc)
    invaderXim.transport.onDockTimekeeperTrigger(player, npc)
end

return entity
