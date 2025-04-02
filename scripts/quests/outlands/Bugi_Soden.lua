-----------------------------------
-- Bugi Soden
-- Ryoma !pos -23 0 -9 252
-- qm1 !pos 110 15 162 213
-----------------------------------
local norgID   = zones[invaderXim.zone.NORG]
local onzozoID = zones[invaderXim.zone.LABYRINTH_OF_ONZOZO]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BUGI_SODEN)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.NORG,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:canEquipItem(invaderXim.item.KODACHI_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.KATANA) / 10 >= 250 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.NORG] =
        {
            ['Ryoma'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(184):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [184] = function(player, csid, option, npc)
                    if
                        option == 1 and
                        (player:hasItem(invaderXim.item.KODACHI_OF_TRIALS) or npcUtil.giveItem(player, invaderXim.item.KODACHI_OF_TRIALS))
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

        [invaderXim.zone.NORG] =
        {
            ['Ryoma'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(189) -- complete
                    elseif player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) then
                        return quest:event(188) -- cont 2
                    else
                        return quest:event(185) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.KODACHI_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(186) -- unfinished weapon
                        else
                            return quest:progressEvent(187) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [185] = function(player, csid, option, npc)
                    if option == 2 then
                        player:delQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.BUGI_SODEN)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    elseif not player:hasItem(invaderXim.item.KODACHI_OF_TRIALS) then
                        npcUtil.giveItem(player, invaderXim.item.KODACHI_OF_TRIALS)
                    end
                end,

                [187] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [189] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:addLearnedWeaponskill(invaderXim.wsUnlock.BLADE_KU)
                        player:messageSpecial(norgID.text.BLADE_KU_LEARNED)
                    end
                end,
            },
        },

        [invaderXim.zone.LABYRINTH_OF_ONZOZO] =
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
                        npcUtil.popFromQM(player, npc, onzozoID.mob.MEGAPOD_MEGALOPS, { hide = 0 })
                    then
                        return quest:messageSpecial(onzozoID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Megapod_Megalops'] =
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
