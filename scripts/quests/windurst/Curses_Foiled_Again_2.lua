-----------------------------------
-- Curses, Foiled Again!? (2)
-----------------------------------
-- !addquest 2 33
-- Shantotto : !pos 122 -2 112 239
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_AGAIN_2)

quest.reward =
{
    fame     = 90,
    fameArea = invaderXim.fameArea.WINDURST,
    item     = invaderXim.item.MISERY_STAFF,
    title    = invaderXim.title.HEXER_VEXER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_AGAIN_1) and
                player:getFameLevel(invaderXim.fameArea.WINDURST) >= 2
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Shantotto'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Timer') <= VanadielUniqueDay() and
                        not invaderXim.quest.getMustZone(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_AGAIN_1)
                    then
                        local questProgress = quest:getVar(player, 'Prog')

                        if questProgress == 0 then
                            return quest:event(178)
                        elseif questProgress == 1 then
                            return quest:event(177)
                        elseif
                            questProgress == 2 and
                            not quest:getMustZone(player)
                        then
                            return quest:progressEvent(180, 0, 0, 0, 0, invaderXim.item.PINCH_OF_BOMB_ASH, invaderXim.item.BONE_CHIP, invaderXim.item.BOMB_ARM, invaderXim.item.REVIVAL_TREE_ROOT)
                        end
                    else
                        return quest:event(174)
                    end
                end,
            },

            ['Hiwon-Biwon'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Timer') <= VanadielUniqueDay() and
                        not invaderXim.quest.getMustZone(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_AGAIN_1)
                    then
                        -- NOTE: There is interplay between Making Headlines and this quest for dialogue.  We should be safe with
                        -- fallthroughs in interaction, but also there may be a better method to implement both.

                        if player:getQuestStatus(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.MAKING_HEADLINES) == invaderXim.questStatus.QUEST_ACCEPTED then
                            return quest:progressEvent(284)
                        else
                            return quest:progressEvent(179)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [177] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                    quest:setMustZone(player)
                end,

                [179] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                [180] = function(player, csid, option, npc)
                    if option == 3 then
                        quest:begin(player)
                        player:setTitle(invaderXim.title.TARUTARU_MURDER_SUSPECT)
                    end
                end,

                [284] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,
            },
        }
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Shantotto'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { invaderXim.item.BOMB_ARM, 2 }, invaderXim.item.REVIVAL_TREE_ROOT, invaderXim.item.LOCK_OF_HIWONS_HAIR }) then
                        return quest:progressEvent(183, 0, 0, 0, 0, 0, 0, invaderXim.item.BOMB_ARM, invaderXim.item.REVIVAL_TREE_ROOT)
                    end
                end,

                onTrigger = quest:event(181, 0, 0, 0, 0, 0, 0, invaderXim.item.BOMB_ARM, invaderXim.item.REVIVAL_TREE_ROOT),
            },

            ['Hiwon-Biwon'] = quest:progressEvent(182),

            onEventFinish =
            {
                [182] = function(player, csid, option, npc)
                    -- NOTE: This event is blocking, and always attempts to give to player, even
                    -- if one is currently in inventory.

                    npcUtil.giveItem(player, invaderXim.item.LOCK_OF_HIWONS_HAIR)
                end,

                [183] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()

                        invaderXim.quest.setMustZone(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_A_GOLEM)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                not player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_A_GOLEM)
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Hiwon-Biwon'] = quest:event(185):replaceDefault(),
            ['Shantotto']   = quest:event(184):replaceDefault(),
        },
    },
}

return quest
