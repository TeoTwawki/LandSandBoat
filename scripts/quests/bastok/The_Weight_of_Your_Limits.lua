-----------------------------------
-- The Weight of Your Limits
-- Iron Eater !pos 92 -19.6 2 237
-- qm1 !pos -324 1 474 121
-----------------------------------
local metalworksID = zones[invaderXim.zone.METALWORKS]
local ziTahID      = zones[invaderXim.zone.THE_SANCTUARY_OF_ZITAH]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_WEIGHT_OF_YOUR_LIMITS)

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
                player:canEquipItem(invaderXim.item.AXE_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.GREAT_AXE) / 10 >= 240 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Iron_Eater'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(790):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [790] = function(player, csid, option, npc)
                    if
                        player:hasItem(invaderXim.item.AXE_OF_TRIALS) or
                        npcUtil.giveItem(player, invaderXim.item.AXE_OF_TRIALS)
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
            ['Iron_Eater'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(794) -- complete
                    else
                        local hideReacquireMenuItem = (player:hasItem(invaderXim.item.AXE_OF_TRIALS) or player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)) and 1 or 0
                        return quest:event(791, hideReacquireMenuItem) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.AXE_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(792) -- unfinished weapon
                        else
                            return quest:progressEvent(793) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [791] = function(player, csid, option, npc)
                    if option == 1 and not player:hasItem(invaderXim.item.AXE_OF_TRIALS) then
                        npcUtil.giveItem(player, invaderXim.item.AXE_OF_TRIALS)
                    elseif option == 2 then
                        player:delQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_WEIGHT_OF_YOUR_LIMITS)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    end
                end,

                [793] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [794] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:addLearnedWeaponskill(invaderXim.wsUnlock.STEEL_CYCLONE)
                        player:messageSpecial(metalworksID.text.STEEL_CYCLONE_LEARNED)
                    end
                end,
            },
        },

        [invaderXim.zone.THE_SANCTUARY_OF_ZITAH] =
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
                        npcUtil.popFromQM(player, npc, ziTahID.mob.GREENMAN, { hide = 0 })
                    then
                        return quest:messageSpecial(ziTahID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Greenman'] =
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
