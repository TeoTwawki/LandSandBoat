-----------------------------------
-- Area: Port Windurst
--  NPC: Janshura Rashura
-- Starts Windurst Missions
-- !pos -227 -8 184 240
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getNation() ~= invaderXim.nation.WINDURST then
        player:startEvent(71) -- for other nation
    else
        local currentMission = player:getCurrentMission(invaderXim.mission.log_id.WINDURST)

        if currentMission ~= invaderXim.mission.id.windurst.NONE then
            player:startEvent(76)
        else
            -- NPC dialog changes when starting 3-2 according to whether it's the first time or being repeated
            local param3 = player:hasCompletedMission(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.WRITTEN_IN_THE_STARS) and 1 or 0
            local flagMission, repeatMission = invaderXim.mission.getMissionMask(player)

            player:startEvent(78, flagMission, 0, param3, 0, invaderXim.ki.STAR_CRESTED_SUMMONS_1, repeatMission)
        end
    end
end

return entity
