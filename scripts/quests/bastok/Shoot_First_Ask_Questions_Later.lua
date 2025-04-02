-----------------------------------
-- Shoot First, Ask Questions Later
-- Cid !pos -12 -12 1 237
-- qm1 !pos -11 -19 -177 153
-----------------------------------
local metalworksID = zones[invaderXim.zone.METALWORKS]
local boyahdaTreeID = zones[invaderXim.zone.THE_BOYAHDA_TREE]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.SHOOT_FIRST_ASK_QUESTIONS_LATER)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.BASTOK,
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:canEquipItem(invaderXim.item.GUN_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.MARKSMANSHIP) / 10 >= 250 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Cid'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(795):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [795] = function(player, csid, option, npc)
                    if
                        player:hasItem(invaderXim.item.GUN_OF_TRIALS) or
                        npcUtil.giveItem(player, invaderXim.item.GUN_OF_TRIALS)
                    then
                        npcUtil.giveKeyItem(player, invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Cid'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(799) -- complete
                    else
                        local hideReacquireMenuItem = (player:hasItem(invaderXim.item.GUN_OF_TRIALS) or player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)) and 1 or 0
                        return quest:event(796, hideReacquireMenuItem) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.GUN_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(797) -- unfinished weapon
                        else
                            return quest:progressEvent(798) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [796] = function(player, csid, option, npc)
                    if
                        option == 1 and
                        not player:hasItem(invaderXim.item.GUN_OF_TRIALS)
                    then
                        npcUtil.giveItem(player, invaderXim.item.GUN_OF_TRIALS)
                    elseif option == 2 then
                        player:delQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.SHOOT_FIRST_ASK_QUESTIONS_LATER)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    end
                end,

                [798] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [799] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:addLearnedWeaponskill(invaderXim.wsUnlock.DETONATOR)
                        player:messageSpecial(metalworksID.text.DETONATOR_LEARNED)
                    end
                end,
            },
        },

        [invaderXim.zone.THE_BOYAHDA_TREE] =
        {
            ['qm1'] =
            {
                onTrigger = function(player, npc)
                    if player:getLocalVar('killed_wsnm') == 1 then
                        player:setLocalVar('killed_wsnm', 0)
                        return quest:keyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                    elseif
                        player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) and
                        not player:hasKeyItem(invaderXim.keyItem.ANNALS_OF_TRUTH) and
                        npcUtil.popFromQM(player, npc, boyahdaTreeID.mob.BEET_LEAFHOPPER, { hide = 0 })
                    then
                        return quest:messageSpecial(boyahdaTreeID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Beet_Leafhopper'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) then
                        player:setLocalVar('killed_wsnm', 1)
                    end
                end,
            },
        },
    },
}

return quest
