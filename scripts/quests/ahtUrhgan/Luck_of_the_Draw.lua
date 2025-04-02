-----------------------------------
-- Luck of the Draw
-- Corsair Job Flag Quest
-----------------------------------
-- Log ID: 6, Quest ID: 6
-- Ratihb           : !pos 75.225 -6.000 -137.203 50
-- Mafwahb          : !pos 149.11 -2.000 -2.7127 50
-- qm6 (H-10 / Boat): !pos 468.767 -12.292 111.817 54
-- qm1              : !pos -62.239 -7.9619 -137.1251
-- _1l0 (Rock Slab) : !pos -99 -7 -91 57
-----------------------------------
local talaccaCoveID = zones[invaderXim.zone.TALACCA_COVE]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.LUCK_OF_THE_DRAW)

quest.reward =
{
    item    = invaderXim.item.CORSAIR_DIE,
    keyItem = invaderXim.ki.JOB_GESTURE_CORSAIR,
    title   = invaderXim.title.SEAGULL_PHRATRIE_CREW_MEMBER,
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Ratihb'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(547)
                end,
            },

            onEventFinish =
            {
                [547] = function(player, csid, option, npc)
                    quest:begin(player)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Mafwahb'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 1 then
                        return quest:progressEvent(548)
                    elseif questProgress == 2 then
                        return quest:event(647)
                    end
                end,
            },

            onEventFinish =
            {
                [548] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,
            },
        },

        [invaderXim.zone.ARRAPAGO_REEF] =
        {
            ['qm6'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(211)
                    end
                end,
            },

            onEventFinish =
            {
                [211] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                end,
            },
        },

        [invaderXim.zone.TALACCA_COVE] =
        {
            ['qm1'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 3 then
                        return quest:progressEvent(2)
                    end
                end,
            },

            ['_1l0'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 4 then
                        return quest:progressEvent(3)
                    end
                end,
            },

            onEventFinish =
            {
                [2] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 4)
                    npcUtil.giveKeyItem(player, invaderXim.ki.FORGOTTEN_HEXAGUN)
                end,

                [3] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.FORGOTTEN_HEXAGUN)
                        player:unlockJob(invaderXim.job.COR)
                        player:messageSpecial(talaccaCoveID.text.YOU_CAN_NOW_BECOME_A_CORSAIR)
                    end
                end,
            },
        }
    },

    -- Section: Quest complete.
    {
        check = function(player, status, vars)
            -- Event 552 is a one-time-only event that can occur after completing "Luck of the Draw"
            -- but before finishing Equipped for all Occasions.
            -- This charvar is cleaned up on complete of 'Equipped for all Occasions' when quest:complete() is called.

            return status == invaderXim.questStatus.QUEST_COMPLETED and
                invaderXim.quest.getVar(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.EQUIPPED_FOR_ALL_OCCASIONS, 'Stage') == 0 and
                not player:hasCompletedQuest(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.EQUIPPED_FOR_ALL_OCCASIONS)
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Ratihb'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(552)
                end,
            },

            onEventFinish =
            {
                [552] = function(player, csid, option, npc)
                    invaderXim.quest.setVar(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.EQUIPPED_FOR_ALL_OCCASIONS, 'Stage', 1)
                end,
            },
        },
    }
}

return quest
