-----------------------------------
-- A Vow of Truth
-- Seekers of Adoulin M4-2-3
-----------------------------------
-- !addmission 12 80
-- Levil   : !pos -87.204 3.350 12.655 256
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.A_VOW_OF_TRUTH)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.DARRCUILN },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(165),
        },

        [invaderXim.zone.WOH_GATES] =
        {
            onZoneIn = function(player, prevZone)
                return 7
            end,

            onEventFinish =
            {
                [7] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
