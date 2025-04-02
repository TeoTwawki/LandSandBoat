-----------------------------------
-- Axe the Competition
-- Brutus !pos -55 8 95 244
-- qm9 !pos 218 -8 206 159
-----------------------------------
local upperJeunoID = zones[invaderXim.zone.UPPER_JEUNO]
local uggalepihID = zones[invaderXim.zone.TEMPLE_OF_UGGALEPIH]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.AXE_THE_COMPETITION)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.JEUNO,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:canEquipItem(invaderXim.item.PICK_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.AXE) / 10 >= 240 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Brutus'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(12):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [12] = function(player, csid, option, npc)
                    if
                        option == 1 and
                        (player:hasItem(invaderXim.item.PICK_OF_TRIALS) or npcUtil.giveItem(player, invaderXim.item.PICK_OF_TRIALS))
                    then
                        npcUtil.giveKeyItem(player, invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
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

        [invaderXim.zone.UPPER_JEUNO] =
        {
            ['Brutus'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(17) -- complete
                    elseif player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) then
                        return quest:event(16) -- cont 2
                    else
                        return quest:event(15, player:hasItem(invaderXim.item.PICK_OF_TRIALS) and 1 or 0) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.PICK_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(14) -- unfinished weapon
                        else
                            return quest:progressEvent(13) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [15] = function(player, csid, option, npc)
                    if option == 1 and not player:hasItem(invaderXim.item.PICK_OF_TRIALS) then
                        npcUtil.giveItem(player, invaderXim.item.PICK_OF_TRIALS)
                    elseif option == 2 then
                        player:delQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.AXE_THE_COMPETITION)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    end
                end,

                [13] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [17] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:addLearnedWeaponskill(invaderXim.wsUnlock.DECIMATION)
                        player:messageSpecial(upperJeunoID.text.DECIMATION_LEARNED)
                    end
                end,
            },
        },

        [invaderXim.zone.TEMPLE_OF_UGGALEPIH] =
        {
            ['qm9'] =
            {
                onTrigger = function(player, npc)
                    if player:getLocalVar('killed_wsnm') == 1 then
                        player:setLocalVar('killed_wsnm', 0)
                        return quest:keyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                    elseif
                        player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) and
                        not player:hasKeyItem(invaderXim.keyItem.ANNALS_OF_TRUTH) and
                        npcUtil.popFromQM(player, npc, uggalepihID.mob.YALLERY_BROWN, { hide = 0 })
                    then
                        return quest:messageSpecial(uggalepihID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Yallery_Brown'] =
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
