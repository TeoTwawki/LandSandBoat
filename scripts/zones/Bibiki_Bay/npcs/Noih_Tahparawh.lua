-----------------------------------
-- Area: Bibiki Bay
--  NPC: Noih Tahparawh
-- Type: Manaclipper Timekeeper
-- !pos -392 -3 -385 4
-----------------------------------
---@type TNpcEntity
local entity = {}

local timekeeperLocation = invaderXim.manaclipper.location.PURGONORGO_ISLE
local timekeeperEventId = 19

entity.onTrigger = function(player, npc)
    invaderXim.manaclipper.timekeeperOnTrigger(player, timekeeperLocation, timekeeperEventId)
end

return entity
