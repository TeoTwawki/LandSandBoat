-----------------------------------
-- Cait Sith
-- Wings of the Goddess Mission 3
-----------------------------------
-- !addmission 5 2
-- BURDEN_OF_SUSPICION  : !completequest 7 20
-- WRATH_OF_THE_GRIFFON : !completequest 7 25
-- A_MANIFEST_PROBLEM   : !completequest 7 28
-- EAST_RONFAURE_S      : !zone 81
-- SOUTHERN_SAN_DORIA_S : !zone 80
-----------------------------------
require('scripts/missions/wotg/helpers')
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.CAIT_SITH)

mission.reward =
{
    title       = invaderXim.title.CAIT_SITHS_ASSISTANT,
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.THE_QUEEN_OF_THE_DANCE },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId and
                invaderXim.wotg.helpers.meetsMission3Reqs(player)
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA_S] =
        {
            onZoneIn = function(player, prevZone)
                if prevZone == invaderXim.zone.EAST_RONFAURE_S then
                    return 67
                end
            end,

            onEventFinish =
            {
                [67] = function(player, csid, option, npc)
                    if player:getCurrentMission(invaderXim.mission.log_id.ROV) == invaderXim.mission.id.rov.CAUTERIZE then
                        npcUtil.giveKeyItem(player, invaderXim.ki.LIGHTSWORM)
                    end

                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
