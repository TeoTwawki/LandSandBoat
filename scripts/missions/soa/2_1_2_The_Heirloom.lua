-----------------------------------
-- The Heirloom
-- Seekers of Adoulin M2-1-2
-----------------------------------
-- !addmission 12 13
-- Ploh Trishbahk (trigger area) : !pos 100.580 -40.150 -63.830 257
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.THE_HEIRLOOM)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.AN_AIMLESS_JOURNEY },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(103),
        },

        [invaderXim.zone.EASTERN_ADOULIN] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    return mission:progressEvent(1502)
                end,
            },

            onEventFinish =
            {
                [1502] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
