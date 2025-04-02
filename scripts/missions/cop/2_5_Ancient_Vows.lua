-----------------------------------
-- Ancient Vows
-- Promathia 2-5
-----------------------------------
-- !addmission 6 248
-- Dilapidated Gate : !pos -259 -30 276 25
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.ANCIENT_VOWS)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_CALL_OF_THE_WYRMKING },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Justinius'] = mission:event(128):replaceDefault(),
        },

        [invaderXim.zone.MISAREAUX_COAST] =
        {
            ['_0p2'] =
            {
                onTrigger = function(player, npc)
                    if mission:getVar(player, 'Status') == 0 then
                        return mission:progressEvent(6)
                    end
                end,
            },

            onEventFinish =
            {
                [6] = function(player, csid, option, npc)
                    mission:setVar(player, 'Status', 1)
                end,
            },
        },

        [invaderXim.zone.RIVERNE_SITE_A01] =
        {
            onZoneIn = function(player, prevZone)
                if mission:getVar(player, 'Status') == 1 then
                    return 100
                end
            end,

            onEventFinish =
            {
                [100] = function(player, csid, option, npc)
                    mission:setVar(player, 'Status', 2)
                end,
            },
        },

        [invaderXim.zone.MONARCH_LINN] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if
                        mission:getVar(player, 'Status') == 2 and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.ANCIENT_VOWS
                    then
                        mission:complete(player)
                        player:setPos(694, -5.5, -619, 74, 107) -- South Gustaberg
                    end
                end,
            },
        },
    },
}

return mission
