-----------------------------------
-- Legacy of the Lost
-- Aht Uhrgan Mission 35
-----------------------------------
-- !addmission 4 34
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.LEGACY_OF_THE_LOST)

mission.reward =
{
    title       = invaderXim.title.GESSHOS_MERCY,
    nextMission = { invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.GAZE_OF_THE_SABOTEUR },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.TALACCA_COVE] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.LEGACY_OF_THE_LOST then
                        mission:complete(player)
                    end
                end,
            },
        },
    },
}

return mission
