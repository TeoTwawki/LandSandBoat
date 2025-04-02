-----------------------------------
-- Leafallia
-- Seekers of Adoulin M4-3-6
-----------------------------------
-- !addmission 12 89
-- Levil      : !pos -87.204 3.350 12.655 256
-- Aged Stump : !pos -27.233 -2 33.508 281
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.LEAFALLIA)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.ROSULATIAS_PROMISE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:progressEvent(166),
        },

        [invaderXim.zone.LEAFALLIA] =
        {
            ['Aged_Stump'] = mission:progressEvent(4, 281, 2955693, 1756, 0, 58029558, 583532, 4095, 131184),

            onEventFinish =
            {
                [4] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
