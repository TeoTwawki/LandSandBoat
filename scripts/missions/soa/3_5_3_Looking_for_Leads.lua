-----------------------------------
-- Looking for Leads
-- Seekers of Adoulin M3-5-3
-----------------------------------
-- !addmission 12 61
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.LOOKING_FOR_LEADS)

mission.reward =
{
    keyItem     = invaderXim.ki.TINTINNABULUM,
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.DRIFTING_NORTHWEST },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(144),
        },

        [invaderXim.zone.EASTERN_ADOULIN] =
        {
            onTriggerAreaEnter =
            {
                [3] = function(player, triggerArea)
                    return mission:progressEvent(1517)
                end,
            },

            onEventFinish =
            {
                [1517] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
