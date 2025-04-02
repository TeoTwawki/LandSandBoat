-----------------------------------
-- Souls in Shadow
-- Novalmauge !pos 70 -24 21 167
-- qm2 !pos 118 36 -281 160
-----------------------------------
local bostaunieuxID = zones[invaderXim.zone.BOSTAUNIEUX_OUBLIETTE]
local denOfRancorID = zones[invaderXim.zone.DEN_OF_RANCOR]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.SOULS_IN_SHADOW)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.SANDORIA,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:canEquipItem(invaderXim.item.SCYTHE_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.SCYTHE) / 10 >= 240 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.BOSTAUNIEUX_OUBLIETTE] =
        {
            ['Novalmauge'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(0):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    if
                        option == 1 and
                        (
                            player:hasItem(invaderXim.item.SCYTHE_OF_TRIALS) or
                            npcUtil.giveItem(player, invaderXim.item.SCYTHE_OF_TRIALS)
                        )
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

        [invaderXim.zone.BOSTAUNIEUX_OUBLIETTE] =
        {
            ['Novalmauge'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(5) -- complete
                    elseif player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) then
                        return quest:event(4) -- cont 2
                    else
                        return quest:event(3, player:hasItem(invaderXim.item.SCYTHE_OF_TRIALS) and 1 or 0) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.SCYTHE_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(2) -- unfinished weapon
                        else
                            return quest:progressEvent(1) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [3] = function(player, csid, option, npc)
                    if option == 1 and not player:hasItem(invaderXim.item.SCYTHE_OF_TRIALS) then
                        npcUtil.giveItem(player, invaderXim.item.SCYTHE_OF_TRIALS)
                    elseif option == 2 then
                        player:delQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.SOULS_IN_SHADOW)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    end
                end,

                [1] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [5] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:addLearnedWeaponskill(invaderXim.wsUnlock.SPIRAL_HELL)
                        player:messageSpecial(bostaunieuxID.text.SPIRAL_HELL_LEARNED)
                    end
                end,
            },
        },

        [invaderXim.zone.DEN_OF_RANCOR] =
        {
            ['qm2'] =
            {
                onTrigger = function(player, npc)
                    if player:getLocalVar('killed_wsnm') == 1 then
                        player:setLocalVar('killed_wsnm', 0)
                        return quest:keyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                    elseif
                        player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) and
                        not player:hasKeyItem(invaderXim.keyItem.ANNALS_OF_TRUTH) and
                        npcUtil.popFromQM(player, npc, denOfRancorID.mob.MOKUMOKUREN, { hide = 0 })
                    then
                        return quest:messageSpecial(denOfRancorID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Mokumokuren'] =
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
