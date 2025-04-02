-----------------------------------
-- From Saplings Grow
-- Perih Vashai !pos 117 -3 92 241
-- qm1 !pos -157 -8 198.2 113
-----------------------------------
local windurstWoodsID = zones[invaderXim.zone.WINDURST_WOODS]
local capeTerigganID  = zones[invaderXim.zone.CAPE_TERIGGAN]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.FROM_SAPLINGS_GROW)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.WINDURST,
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:canEquipItem(invaderXim.item.BOW_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.ARCHERY) / 10 >= 250 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.WINDURST_WOODS] =
        {
            ['Perih_Vashai'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(661):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [661] = function(player, csid, option, npc)
                    if
                        player:hasItem(invaderXim.item.BOW_OF_TRIALS) or
                        npcUtil.giveItem(player, invaderXim.item.BOW_OF_TRIALS)
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

        [invaderXim.zone.WINDURST_WOODS] =
        {
            ['Perih_Vashai'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(666) -- complete
                    elseif player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) then
                        return quest:event(665) -- cont 2
                    else
                        return quest:event(662, 0, invaderXim.item.BOW_OF_TRIALS, 0, 0, player:hasItem(invaderXim.item.BOW_OF_TRIALS) and 2 or 0) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.BOW_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(663) -- unfinished weapon
                        else
                            return quest:progressEvent(664, 0, 0, invaderXim.ki.ANNALS_OF_TRUTH) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [662] = function(player, csid, option, npc)
                    if option == 1 and not player:hasItem(invaderXim.item.BOW_OF_TRIALS) then
                        npcUtil.giveItem(player, invaderXim.item.BOW_OF_TRIALS)
                    elseif option == 3 then
                        player:delQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.FROM_SAPLINGS_GROW)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    end
                end,

                [664] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [666] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:addLearnedWeaponskill(invaderXim.wsUnlock.EMPYREAL_ARROW)
                        player:messageSpecial(windurstWoodsID.text.EMPYREAL_ARROW_LEARNED)
                    end
                end,
            },
        },

        [invaderXim.zone.CAPE_TERIGGAN] =
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
                        npcUtil.popFromQM(player, npc, capeTerigganID.mob.STOLAS, { hide = 0 })
                    then
                        return quest:messageSpecial(capeTerigganID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Stolas'] =
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
