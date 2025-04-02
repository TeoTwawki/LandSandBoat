-----------------------------------
-- Area: Mhaura
--  NPC: Dieh Yamilsiah
-- Reports the time remaining before boat arrival.
-- !pos 7.057 -2.364 2.489 249
-----------------------------------
local ID = zones[invaderXim.zone.MHAURA]
-----------------------------------
---@type TNpcEntity
local entity = {}

local messages =
{
    [invaderXim.transport.trigger.mhaura.FERRY_ARRIVING_FROM_ALZAHBI] = ID.text.FERRY_ARRIVING,
    [invaderXim.transport.trigger.mhaura.FERRY_DEPARTING_TO_ALZAHBI]  = ID.text.FERRY_DEPARTING,
    [invaderXim.transport.trigger.mhaura.FERRY_ARRIVING_FROM_SELBINA] = ID.text.FERRY_ARRIVING,
    [invaderXim.transport.trigger.mhaura.FERRY_DEPARTING_TO_SELBINA]  = ID.text.FERRY_DEPARTING
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    -- TODO: NPC needs to rotate after finishing walking.
    npc:addPeriodicTrigger(invaderXim.transport.trigger.mhaura.FERRY_ARRIVING_FROM_ALZAHBI,
        invaderXim.transport.interval.mhaura.FROM_TO_ALZAHBI,
        invaderXim.transport.offset.mhaura.FERRY_ARRIVING_FROM_ALZAHBI)
    npc:addPeriodicTrigger(invaderXim.transport.trigger.mhaura.FERRY_DEPARTING_TO_ALZAHBI,
        invaderXim.transport.interval.mhaura.FROM_TO_ALZAHBI,
        invaderXim.transport.offset.mhaura.FERRY_DEPARTING_TO_ALZAHBI)
    npc:addPeriodicTrigger(invaderXim.transport.trigger.mhaura.FERRY_ARRIVING_FROM_SELBINA,
        invaderXim.transport.interval.mhaura.FROM_TO_SELBINA,
        invaderXim.transport.offset.mhaura.FERRY_ARRIVING_FROM_SELBINA)
    npc:addPeriodicTrigger(invaderXim.transport.trigger.mhaura.FERRY_DEPARTING_TO_SELBINA,
        invaderXim.transport.interval.mhaura.FROM_TO_SELBINA,
        invaderXim.transport.offset.mhaura.FERRY_DEPARTING_TO_SELBINA)
end

entity.onTimeTrigger = function(npc, triggerID)
    invaderXim.transport.dockMessage(npc, triggerID, messages, 'mhaura')
end

entity.onTrigger = function(player, npc)
    invaderXim.transport.onDockTimekeeperTrigger(player, npc)

    --[[Other cutscenes:
    233 "This ship is headed for Selbina."
    234 "The Selbina ferry will deparrrt soon!  Passengers are to board the ship immediately!"

    Can't find a way to toggle the destination on 233 or 234, so they are not used.
    Users knowing which ferry is which > using all CSs.]]
end

return entity
