-----------------------------------
-- To the Victor
-- Seekers of Adoulin M3-4-1
-----------------------------------
-- !addmission 12 52
-- Levil : !pos -87.204 3.350 12.655 256
-----------------------------------
require('scripts/missions/soa/helpers')
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.TO_THE_VICTOR)

mission.reward =
{
    title       = invaderXim.title.BOOMY_AND_BUSTY,
    nextMission = { invaderXim.mission.log_id.SOA, invaderXim.mission.id.soa.AN_EXTRAORDINARY_GENTLEMAN },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.WESTERN_ADOULIN] =
        {
            ['Levil'] = mission:event(142),

            ['Masad'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.CARD_JAILER_TEODOR) then
                        return mission:progressEvent(153)
                    else
                        invaderXim.soa.helpers.initGameRound(player)
                        player:setLocalVar('sessionScore', 0)

                        return mission:event(134, mission:getVar(player, 'Status'))
                    end
                end,
            },

            onEventUpdate =
            {
                [134] = function(player, csid, option, npc)
                    invaderXim.soa.helpers.updateMinigameEvent(player, csid, option, npc)
                end,
            },

            onEventFinish =
            {
                [134] = function(player, csid, option, npc)
                    if option == 0 then
                        player:startEvent(153)
                    elseif option == 2 then
                        mission:setVar(player, 'Status', 2)
                    end
                end,

                [153] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
