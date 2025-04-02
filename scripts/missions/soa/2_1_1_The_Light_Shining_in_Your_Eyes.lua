-----------------------------------
-- The Light Shining in Your Eyes
-- Seekers of Adoulin M2-1-1
-----------------------------------
-- !addmission 12 12
-- Levil : !pos -87.204 3.350 12.655 256
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.THE_LIGHT_SHINING_IN_YOUR_EYES)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.THE_HEIRLOOM },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] =
            {
                onTrigger = function(player, npc)
                    return mission:progressEvent(9)
                end,
            },

            onEventFinish =
            {
                [9] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
