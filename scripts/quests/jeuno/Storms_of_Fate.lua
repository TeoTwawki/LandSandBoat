-----------------------------------
-- Storms of Fate
-----------------------------------
-- Log ID: 3, Quest ID: 86
-- _0p2                  : !pos -259 -30 276 25
-- Unstable_Displacement : !pos -612.800 1.750 693.190 29
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.STORMS_OF_FATE)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getCurrentMission(invaderXim.mission.log_id.COP) == invaderXim.mission.id.cop.DAWN and
                invaderXim.mission.getVar(player, invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.DAWN, 'Status') == 8 and
                not quest:getMustZone(player)
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    return quest:progressEvent(142)
                end,
            },

            onEventFinish =
            {
                [142] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    else
                        -- TODO: There may be an alternate event or parameters passed if this quest was
                        -- initially declined.  This mustZone is a placeholder only, and needs verification.

                        quest:setMustZone(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.MISAREAUX_COAST] =
        {
            ['_0p2'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(559)
                    end
                end,
            },

            onEventFinish =
            {
                [559] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },

        [invaderXim.zone.RIVERNE_SITE_B01] =
        {
            ['Unstable_Displacement'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(1)
                    end
                end,
            },

            onEventFinish =
            {
                [1] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,

                [32001] = function(player, csid, option, npc)
                    if
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.STORMS_OF_FATE and
                        quest:getVar(player, 'Prog') == 2
                    then
                        npcUtil.giveKeyItem(player, invaderXim.ki.WHISPER_OF_THE_WYRMKING)
                        quest:setVar(player, 'Prog', 3)
                    end
                end,
            },
        },

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    if quest:getVar(player, 'Prog') == 3 then
                        return quest:progressEvent(143)
                    end
                end,
            },

            onEventFinish =
            {
                [143] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        invaderXim.quest.setVar(player, invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED, 'Timer', VanadielUniqueDay() + 1)
                    end
                end,
            },
        },
    },
}

return quest
