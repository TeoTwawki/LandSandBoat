-----------------------------------
-- Flames in the Darkness
-- Promathia 7-2
-----------------------------------
-- !addmission 6 718
-- Dilapidated Gate : !pos -259 -30 276 25
-- Sueleen          : !pos 612 132 774 32
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.FLAMES_IN_THE_DARKNESS)

mission.reward =
{
    title = invaderXim.title.ESHANTARLS_COMRADE_IN_ARMS,
    nextMission = { invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.FIRE_IN_THE_EYES_OF_MEN },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.MISAREAUX_COAST] =
        {
            ['_0p2'] =
            {
                onTrigger = function(player, npc)
                    if mission:getVar(player, 'Status') == 0 then
                        return mission:progressEvent(12)
                    end
                end,
            },

            onEventFinish =
            {
                [12] = function(player, csid, option, npc)
                    mission:setVar(player, 'Status', 1)
                end,
            },
        },

        [invaderXim.zone.SEALIONS_DEN] =
        {
            ['Sueleen'] =
            {
                onTrigger = function(player, npc)
                    if mission:getVar(player, 'Status') == 1 then
                        return mission:progressEvent(16)
                    end
                end,
            },

            onEventFinish =
            {
                [16] = function(player, csid, option, npc)
                    mission:setVar(player, 'Status', 2)
                end,
            },
        },

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    if mission:getVar(player, 'Status') == 2 then
                        return mission:progressEvent(10051)
                    end
                end,
            },

            onEventFinish =
            {
                [10051] = function(player, csid, option, npc)
                    mission:setVar(player, 'Status', 3)
                end,
            },
        },

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['_6s1'] =
            {
                onTrigger = function(player, npc)
                    if mission:getVar(player, 'Status') == 3 then
                        return mission:progressEvent(10012)
                    end
                end,
            },

            onEventFinish =
            {
                [10012] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
