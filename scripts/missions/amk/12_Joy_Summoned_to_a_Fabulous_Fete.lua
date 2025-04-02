-----------------------------------
-- Joy! Summoned to a Fabulous Fete
-- A Moogle Kupo d'Etat M12
-- !addmission 10 11
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.AMK, invaderXim.mission.id.amk.JOY_SUMMONED_TO_A_FABULOUS_FETE)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.AMK, invaderXim.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.CASTLE_ZVAHL_BAILEYS] =
        {
            onZoneIn = function(player, prevZone)
                return 88
            end,

            onEventFinish =
            {
                [88] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
