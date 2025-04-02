-----------------------------------
-- In Search of Arciela
-- Seekers of Adoulin M3-5-2
-----------------------------------
-- !addmission 12 59
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.IN_SEARCH_OF_ARCIELA)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.LOOKING_FOR_LEADS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.EASTERN_ADOULIN] =
        {
            ['Ploh_Trishbahk'] = mission:progressEvent(1516):importantOnce(),
        },

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:progressEvent(137),

            onEventFinish =
            {
                [137] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
