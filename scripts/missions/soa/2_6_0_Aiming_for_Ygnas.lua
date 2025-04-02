-----------------------------------
-- Aiming for Ygnas
-- Seekers of Adoulin M2-6
-----------------------------------
-- !addmission 12 26
-- Ploh Trishbahk : !pos 100.580 -40.150 -63.830 257
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.AIMING_FOR_YGNAS)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.CALAMITY_IN_THE_KITCHEN },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(126),
        },

        [invaderXim.zone.EASTERN_ADOULIN] =
        {
            ['Ploh_Trishbahk'] =
            {
                onTrigger = function(player, npc)
                    return mission:progressEvent(1505, 257)
                end,
            },

            onEventFinish =
            {
                [1505] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
