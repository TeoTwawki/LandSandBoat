-----------------------------------
-- Trial-Size Trial by Earth
-----------------------------------
-- Log ID: 1, Quest ID: 72
-- Ferrol : !pos 33.708 6.499 -39.425 236
-----------------------------------
local tremorsID = zones[invaderXim.zone.CLOISTER_OF_TREMORS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRIAL_SIZE_TRIAL_BY_EARTH)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.SCROLL_OF_INSTANT_WARP,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= 20 and
                player:getMainJob() == invaderXim.job.SMN and
                player:getFameLevel(invaderXim.fameArea.BASTOK) >= 2
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            -- NOTE: The below event supports multiple zone references, and which level the Mini Tuning Fork
            -- drops the Avatar fight to.  1 represents Qucksand Caves, and 20 is the level.

            ['Ferrol'] = quest:progressEvent(297, 0, invaderXim.item.MINI_TUNING_FORK_OF_EARTH, 1, 20),

            onEventFinish =
            {
                [297] = function(player, csid, option, npc)
                    if
                        option == 1 and
                        npcUtil.giveItem(player, invaderXim.item.MINI_TUNING_FORK_OF_EARTH)
                    then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Ferrol'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        player:getMainJob() == invaderXim.job.SMN and
                        trade:hasItemQty(invaderXim.item.MINI_TUNING_FORK_OF_EARTH, 1)
                    then
                        return quest:progressEvent(298, 0, invaderXim.item.MINI_TUNING_FORK_OF_EARTH, 1, 20)
                    end
                end,

                onTrigger = function(player, npc)
                    if not player:hasItem(invaderXim.item.MINI_TUNING_FORK_OF_EARTH) then
                        return quest:progressEvent(301, 0, invaderXim.item.MINI_TUNING_FORK_OF_EARTH, 1, 20)
                    else
                        return quest:event(251)
                    end
                end,
            },

            onEventFinish =
            {
                [298] = function(player, csid, option, npc)
                    if option == 1 then
                        invaderXim.teleport.to(player, invaderXim.teleport.id.CLOISTER_OF_TREMORS)
                    end
                end,

                [301] = function(player, csid, option, npc)
                    if option == 1 then
                        npcUtil.giveItem(player, invaderXim.item.MINI_TUNING_FORK_OF_EARTH)
                    end
                end,
            },
        },

        [invaderXim.zone.CLOISTER_OF_TREMORS] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.TRIAL_SIZE_TRIAL_BY_EARTH then
                        if not player:hasSpell(invaderXim.magic.spell.TITAN) then
                            player:addSpell(invaderXim.magic.spell.TITAN)
                            player:messageSpecial(tremorsID.text.TITAN_UNLOCKED, 0, 0, 1)
                        end

                        if not player:hasItem(invaderXim.item.SCROLL_OF_INSTANT_WARP) then
                            npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_INSTANT_WARP)
                        end

                        quest:complete(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Ferrol'] = quest:event(300):replaceDefault(),
        },
    },
}

return quest
