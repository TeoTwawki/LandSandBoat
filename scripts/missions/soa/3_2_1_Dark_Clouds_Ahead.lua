-----------------------------------
-- Dark Clouds Ahead
-- Seekers of Adoulin M3-2-1
-----------------------------------
-- !addmission 12 43
-- Levil : !pos -87.204 3.350 12.655 256
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.DARK_CLOUDS_AHEAD)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.THE_SMALLEST_OF_FAVORS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:progressEvent(132),

            onEventFinish =
            {
                [132] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        invaderXim.mission.setVar(player, invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.THE_SMALLEST_OF_FAVORS, 'Timer', VanadielUniqueDay() + 1)
                    end
                end,
            },
        },
    },
}

return mission
