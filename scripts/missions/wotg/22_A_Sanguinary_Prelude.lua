-----------------------------------
-- A Sanguinary Prelude
-- Wings of the Goddess Mission 22
-----------------------------------
-- !addmission 5 21
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.A_SANGUINARY_PRELUDE)

mission.reward =
{
    keyItem     = invaderXim.ki.AROMA_BUG,
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.DUNGEONS_AND_DANCERS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.BEAUCEDINE_GLACIER_S] =
        {
            onZoneIn = function(player, prevZone)
                return 17
            end,

            onEventFinish =
            {
                [17] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
