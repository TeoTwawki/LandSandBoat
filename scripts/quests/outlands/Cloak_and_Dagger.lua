-----------------------------------
-- Cloak and Dagger
-- Jakoh_Wahcondalo !pos 101 -16 -115 250
-- qm1 !pos 52.8 -1 19.9 212
-----------------------------------
local kazhamID       = zones[invaderXim.zone.KAZHAM]
local gustavTunnelID = zones[invaderXim.zone.GUSTAV_TUNNEL]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.CLOAK_AND_DAGGER)

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
                player:canEquipItem(invaderXim.item.DAGGER_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.DAGGER) / 10 >= 230 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.KAZHAM] =
        {
            ['Jakoh_Wahcondalo'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(279):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [279] = function(player, csid, option, npc)
                    if
                        player:hasItem(invaderXim.item.DAGGER_OF_TRIALS) or
                        npcUtil.giveItem(player, invaderXim.item.DAGGER_OF_TRIALS)
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

        [invaderXim.zone.KAZHAM] =
        {
            ['Jakoh_Wahcondalo'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(284) -- complete
                    elseif player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) then
                        return quest:event(283) -- cont 2
                    else
                        return quest:event(280, 0, invaderXim.item.DAGGER_OF_TRIALS, 0, 0, player:hasItem(invaderXim.item.DAGGER_OF_TRIALS) and 2 or 0) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.DAGGER_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(281) -- unfinished weapon
                        else
                            return quest:progressEvent(282, 0, invaderXim.ki.ANNALS_OF_TRUTH) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [280] = function(player, csid, option, npc)
                    if
                        option == 1 and
                        not player:hasItem(invaderXim.item.DAGGER_OF_TRIALS)
                    then
                        npcUtil.giveItem(player, invaderXim.item.DAGGER_OF_TRIALS)
                    elseif option == 3 then
                        player:delQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.CLOAK_AND_DAGGER)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    end
                end,

                [282] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [284] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:addLearnedWeaponskill(invaderXim.wsUnlock.EVISCERATION)
                        player:messageSpecial(kazhamID.text.EVISCERATION_LEARNED)
                    end
                end,
            },
        },

        [invaderXim.zone.GUSTAV_TUNNEL] =
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
                        npcUtil.popFromQM(player, npc, gustavTunnelID.mob.BARONIAL_BAT, { hide = 0 })
                    then
                        return quest:messageSpecial(gustavTunnelID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Baronial_Bat'] =
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
