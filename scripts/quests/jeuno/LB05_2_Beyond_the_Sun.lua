-----------------------------------
-- Beyond the Sun
-----------------------------------
-- Log ID: 3, Quest ID: 76
-- Maat : !pos 8 3 118 243
-----------------------------------
local ruludeID = zones[invaderXim.zone.RULUDE_GARDENS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.BEYOND_THE_SUN)

quest.reward =
{
    item = invaderXim.item.MAATS_CAP,
    title = invaderXim.title.ULTIMATE_CHAMPION_OF_THE_WORLD,
}

quest.sections =
{
    -- Section: Quest available.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS) == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    if player:getMainJob() <= 15 then
                        if utils.mask.isFull(player:getCharVar('maatsCap'), 15) then -- Defeated maat on 15 jobs
                            return quest:progressEvent(74)
                        else
                            return quest:event(78, player:getMainJob()) -- Rematch dialog. Job dependant.
                        end
                    else
                        return quest:messageText(ruludeID.text.MAAT_CAP_PLACEHOLDER)
                    end
                end,
            },

            onEventFinish =
            {
                [74] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },
    },

    -- Section: Quest completed.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(94) -- Default dialog after completing this quest? Needs confirmation.
                end,
            },
        },
    },
}

return quest
