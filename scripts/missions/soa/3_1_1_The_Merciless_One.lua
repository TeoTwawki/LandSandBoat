-----------------------------------
-- The Merciless One
-- Seekers of Adoulin M3-1-1
-----------------------------------
-- !addmission 12 37
-- Levil : !pos -87.204 3.350 12.655 256
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.THE_MERCILESS_ONE)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.A_CURSE_FROM_THE_PAST },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(138),
        },

        [invaderXim.zone.EASTERN_ADOULIN] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    return mission:progressEvent(1509)
                end,
            },

            onEventFinish =
            {
                [1509] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
