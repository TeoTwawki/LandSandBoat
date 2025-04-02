-----------------------------------
-- An Aimless Journey
-- Seekers of Adoulin M2-2
-----------------------------------
-- !addmission 12 14
-- Ergon Locus : !pos -140.000 10.000 60.000 270
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.AN_AIMLESS_JOURNEY)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.ORTHARSYNE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.CIRDAS_CAVERNS] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    return mission:progressEvent(12)
                end,
            },

            onEventFinish =
            {
                [12] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
