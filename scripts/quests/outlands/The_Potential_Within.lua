-----------------------------------
-- The Potential Within
-- Jaucribaix !pos 91 -7 -8 252
-- qm3 !pos 200 11 99 174
-----------------------------------
local norgID         = zones[invaderXim.zone.NORG]
local kuftalTunnelID = zones[invaderXim.zone.KUFTAL_TUNNEL]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.THE_POTENTIAL_WITHIN)

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
                player:canEquipItem(invaderXim.item.TACHI_OF_TRIALS, true) and
                player:getCharSkillLevel(invaderXim.skill.GREAT_KATANA) / 10 >= 250 and
                not player:hasKeyItem(invaderXim.keyItem.WEAPON_TRAINING_GUIDE)
        end,

        [invaderXim.zone.NORG] =
        {
            ['Jaucribaix'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(178):oncePerZone() -- start
                end,
            },

            onEventFinish =
            {
                [178] = function(player, csid, option, npc)
                    if
                        option == 1 and
                        (player:hasItem(invaderXim.item.TACHI_OF_TRIALS) or npcUtil.giveItem(player, invaderXim.item.TACHI_OF_TRIALS))
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
            ['Jaucribaix'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.ANNALS_OF_TRUTH) then
                        return quest:progressEvent(183) -- complete
                    elseif player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) then
                        return quest:event(182) -- cont 2
                    else
                        return quest:event(179, player:hasItem(invaderXim.item.TACHI_OF_TRIALS) and 1 or 0) -- cont 1
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.TACHI_OF_TRIALS) then
                        local wsPoints = trade:getItem(0):getWeaponskillPoints()

                        if wsPoints < 300 then
                            return quest:event(180) -- unfinished weapon
                        else
                            return quest:progressEvent(181) -- finished weapon
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [179] = function(player, csid, option, npc)
                    if option == 2 then
                        player:delQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.THE_POTENTIAL_WITHIN)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                    elseif not player:hasItem(invaderXim.item.TACHI_OF_TRIALS) then
                        npcUtil.giveItem(player, invaderXim.item.TACHI_OF_TRIALS)
                    end
                end,

                [181] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                end,

                [183] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                        player:delKeyItem(invaderXim.ki.WEAPON_TRAINING_GUIDE)
                        player:addLearnedWeaponskill(invaderXim.wsUnlock.TACHI_KASHA)
                        player:messageSpecial(norgID.text.TACHI_KASHA_LEARNED)
                    end
                end,
            },
        },

        [invaderXim.zone.KUFTAL_TUNNEL] =
        {
            ['qm3'] =
            {
                onTrigger = function(player, npc)
                    if player:getLocalVar('killed_wsnm') == 1 then
                        player:setLocalVar('killed_wsnm', 0)
                        return quest:keyItem(invaderXim.ki.ANNALS_OF_TRUTH)
                    elseif
                        player:hasKeyItem(invaderXim.ki.MAP_TO_THE_ANNALS_OF_TRUTH) and
                        not player:hasKeyItem(invaderXim.keyItem.ANNALS_OF_TRUTH) and
                        npcUtil.popFromQM(player, npc, kuftalTunnelID.mob.KETTENKAEFER, { hide = 0 })
                    then
                        return quest:messageSpecial(kuftalTunnelID.text.SENSE_OMINOUS_PRESENCE)
                    end
                end,
            },

            ['Kettenkaefer'] =
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
