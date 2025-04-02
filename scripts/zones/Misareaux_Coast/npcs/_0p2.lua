-----------------------------------
-- Area: Misareaux Coast
--  NPC: Dilapidated Gate
-- Entrance to Riverne Site #B01
-- !pos -259 -30 276 25
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    -- Can pass after completing COP 2-4
    if
        player:getCurrentMission(invaderXim.mission.log_id.COP) > invaderXim.mission.id.cop.AN_ETERNAL_MELODY or
        player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_LAST_VERSE)
    then
        player:startEvent(552)
    end
end

return entity
