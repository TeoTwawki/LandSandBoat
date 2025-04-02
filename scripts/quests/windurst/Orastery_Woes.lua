-----------------------------------
-- Orastery Woes
-- Kuroido-Moido !pos -112.5 -4.2 102.9 240
-- qm1 !pos 197 -8 -27.5 122
-----------------------------------
local portWindurstID = zones[invaderXim.zone.PORT_WINDURST]
local roMaeveID = zones[invaderXim.zone.ROMAEVE]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.ORASTERY_WOES)

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
                player:canEquipItem(invaderXim.item.CLUB_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.CLUB) / 10 >= 230 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.PORT_WINDURST] =
        {
            ['Kuroido-Moido'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(578):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [578] = function(player, csid, option, npc)
                    if
                        player:hasItem(invaderXim.item.CLUB_OF_TRIALS) or
                        npcUtil.giveItem(player, invaderXim.item.CLUB_OF_TRIALS)
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

        [invaderXim.zone.PORT_WINDURST] =
        {
            ['Kuroido-Moido'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(583) -- complete
                    elseif player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) then
                        return quest:event(582) -- cont 2
                    else
                        return quest:event(579, 0, invaderXim.item.CLUB_OF_TRIALS, 0, 0, player:hasItem(invaderXim.item.CLUB_OF_TRIALS) and 2 or 0) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.CLUB_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(580) -- unfinished weapon
                        else
                            return quest:progressEvent(581, 0, 0, invaderXim.ki.ANNALS_OF_TRUTH) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [579] = function(player, csid, option, npc)
                    if option == 1 and not player:hasItem(invaderXim.item.CLUB_OF_TRIALS) then
                        npcUtil.giveItem(player, invaderXim.item.CLUB_OF_TRIALS)
                    elseif option == 3 then
                        player:delQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.ORASTERY_WOES)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    end
                end,

                [581] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [583] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:addLearnedWeaponskill(invaderXim.wsUnlock.BLACK_HALO)
                        player:messageSpecial(portWindurstID.text.BLACK_HALO_LEARNED)
                    end
                end,
            },
        },

        [invaderXim.zone.ROMAEVE] =
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
                        npcUtil.popFromQM(player, npc, roMaeveID.mob.ELDHRIMNIR, { hide = 0 })
                    then
                        return quest:messageSpecial(roMaeveID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Eldhrimnir'] =
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
