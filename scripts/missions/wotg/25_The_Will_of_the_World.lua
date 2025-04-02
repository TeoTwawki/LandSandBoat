-----------------------------------
-- The Will of the World
-- Wings of the Goddess Mission 25
-----------------------------------
-- !addmission 5 24
-- Raustigne : !pos 3.979 -1.999 44.456 80
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.THE_WILL_OF_THE_WORLD)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.FATE_IN_HAZE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA_S] =
        {
            ['Raustigne'] =
            {
                onTrigger = function(player, npc)
                    return mission:progressEvent(149, player:getCampaignAllegiance(), 5, 2964, 0, 0, 0, 1, 4095)
                end,
            },

            onEventFinish =
            {
                [149] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
