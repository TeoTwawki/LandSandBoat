-----------------------------------
-- Inheritance
-- Gumbah !pos 52 0 -36 234
-- qm1 !pos -660 0 -338 125
-----------------------------------
local bastokMinesID = zones[invaderXim.zone.BASTOK_MINES]
local westernAltepaID = zones[invaderXim.zone.WESTERN_ALTEPA_DESERT]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.INHERITANCE)

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
                player:canEquipItem(invaderXim.item.SWORD_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.GREAT_SWORD) / 10 >= 250 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Gumbah'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(190):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [190] = function(player, csid, option, npc)
                    if
                        player:hasItem(invaderXim.item.SWORD_OF_TRIALS) or
                        npcUtil.giveItem(player, invaderXim.item.SWORD_OF_TRIALS)
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

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Gumbah'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(194) -- complete
                    else
                        local hideReacquireMenuItem = (player:hasItem(invaderXim.item.SWORD_OF_TRIALS) or player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)) and 1 or 0
                        return quest:event(191, hideReacquireMenuItem) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.SWORD_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(192) -- unfinished weapon
                        else
                            return quest:progressEvent(193) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [191] = function(player, csid, option, npc)
                    if option == 1 and not player:hasItem(invaderXim.item.SWORD_OF_TRIALS) then
                        npcUtil.giveItem(player, invaderXim.item.SWORD_OF_TRIALS)
                    elseif option == 2 then
                        player:delQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.INHERITANCE)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    end
                end,

                [193] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [194] = function(player, csid, option, npc)
                    player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                    player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                    player:addLearnedWeaponskill(invaderXim.wsUnlock.GROUND_STRIKE)
                    player:messageSpecial(bastokMinesID.text.GROUND_STRIKE_LEARNED)
                    quest:complete(player)
                end,
            },
        },

        [invaderXim.zone.WESTERN_ALTEPA_DESERT] =
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
                        npcUtil.popFromQM(player, npc, westernAltepaID.mob.MAHARAJA, { hide = 0 })
                    then
                        return quest:messageSpecial(westernAltepaID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Maharaja'] =
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
