-----------------------------------
-- Wildcat with a Gold Pelt
-- Seekers of Adoulin M3-5-1
-----------------------------------
-- !addmission 12 58
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.WILDCAT_WITH_A_GOLD_PELT)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.IN_SEARCH_OF_ARCIELA },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.EASTERN_ADOULIN] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    return mission:progressEvent(1515)
                end,
            },

            onEventFinish =
            {
                [1515] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(143),
        },
    },
}

return mission
