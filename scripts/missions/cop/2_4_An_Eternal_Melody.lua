-----------------------------------
-- An Eternal Melody
-- Promathia 2-4
-----------------------------------
-- !addmission 6 238
-- Walnut Door      : !pos 111 -41 41 26
-- Justinius        : !pos 76 -34 68 26
-- Dilapidated Gate : !pos 260 9 -435 25
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.AN_ETERNAL_MELODY)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.ANCIENT_VOWS },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['_0qa'] =
            {
                onTrigger = function(player, npc)
                    if mission:getVar(player, 'Status') == 0 then
                        return mission:progressEvent(104)
                    end
                end,
            },

            ['Justinius'] =
            {
                onTrigger = function(player, npc)
                    if mission:getVar(player, 'Status') == 1 then
                        return mission:event(127):replaceDefault()
                    else
                        return mission:event(125):replaceDefault()
                    end
                end,
            },

            ['Parelbriaux'] =
            {
                onTrigger = function(player, npc)
                    if mission:getVar(player, 'Status') == 1 then
                        return mission:event(126):replaceDefault()
                    end
                end,
            },

            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    if mission:getVar(player, 'Status') == 2 then
                        return mission:progressEvent(105)
                    end
                end,
            },

            onEventFinish =
            {
                [104] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.MYSTERIOUS_AMULET)
                    mission:setVar(player, 'Status', 1)
                end,

                [105] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },

        [invaderXim.zone.MISAREAUX_COAST] =
        {
            ['_0p0'] =
            {
                onTrigger = function(player, npc)
                    if mission:getVar(player, 'Status') == 1 then
                        return mission:event(5)
                    end
                end,
            },

            onEventFinish =
            {
                [5] = function(player, csid, option, npc)
                    mission:setVar(player, 'Status', 2)
                end,
            },
        },
    },
}

return mission
