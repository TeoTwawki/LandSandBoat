-----------------------------------
-- Area: Western Adoulin
--  NPC: Rising Solstice
-- Starts, Involved With, and Finishes Quest: 'A Certain Substitute Patrolman'
-- !pos -154 4 -29 256
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local adoulinMission = player:getCurrentMission(invaderXim.mission.log_id.SOA)

    if
        adoulinMission >= invaderXim.mission.id.soa.BEAUTY_AND_THE_BEAST and
        adoulinMission <= invaderXim.mission.id.soa.SALVATION
    then
        -- Speech while Arciela is 'kidnapped'
        player:startEvent(150)
    end
end

return entity
