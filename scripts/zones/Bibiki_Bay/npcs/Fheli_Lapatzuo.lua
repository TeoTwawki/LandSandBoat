-----------------------------------
-- Area: Bibiki Bay
--  NPC: Fheli Lapatzuo
-- Type: Manaclipper Timekeeper
-- !pos 488.793 -4.003 709.473 4
-----------------------------------
---@type TNpcEntity
local entity = {}

local timekeeperLocation = invaderXim.manaclipper.location.SUNSET_DOCKS
local timekeeperEventId = 18

entity.onTrigger = function(player, npc)
    invaderXim.manaclipper.timekeeperOnTrigger(player, timekeeperLocation, timekeeperEventId)
end

return entity
