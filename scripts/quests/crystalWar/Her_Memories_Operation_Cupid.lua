-----------------------------------
-- Her Memories: Operation Cupid
-----------------------------------
-- !addquest 7 68
-- Bulwark Gate : !pos -447.174 -1.831 342.417 98
-- Leadavox     : !pos 206 -32 316 83
-----------------------------------
require('scripts/missions/wotg/helpers')
-----------------------------------

local quest = Quest:new(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.HER_MEMORIES_OPERATION_CUPID)

quest.reward =
{
    keyItem = invaderXim.ki.LARGE_MEMORY_FRAGMENT3,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getCurrentMission(invaderXim.mission.log_id.WOTG) == invaderXim.mission.id.wotg.HER_MEMORIES
        end,

        [invaderXim.zone.BATALLIA_DOWNS_S] =
        {
            onZoneIn = function(player, prevZone)
                if prevZone == invaderXim.zone.JUGNER_FOREST_S then
                    return 23
                end
            end,

            onEventFinish =
            {
                [23] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S] =
        {
            ['Bulwark_Gate'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if player:hasKeyItem(invaderXim.ki.POT_OF_MARTIAL_RELISH) then
                        return quest:progressEvent(13)
                    elseif questProgress == 0 then
                        return quest:progressEvent(11)
                    elseif questProgress == 2 then
                        return quest:event(14):oncePerZone()
                    else
                        return quest:event(12):oncePerZone()
                    end
                end,
            },

            onEventFinish =
            {
                [11] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,

                [13] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                    player:delKeyItem(invaderXim.ki.POT_OF_MARTIAL_RELISH)
                end,
            },
        },

        [invaderXim.zone.VUNKERL_INLET_S] =
        {
            ['Leadavox'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        not player:hasKeyItem(invaderXim.ki.POT_OF_MARTIAL_RELISH) and
                        npcUtil.tradeHasExactly(trade, { invaderXim.item.BOTTLE_OF_RICE_VINEGAR, invaderXim.item.JAR_OF_GROUND_WASABI, invaderXim.item.SPRIG_OF_HOLY_BASIL }) and
                        quest:getVar(player, 'Prog') == 1
                    then
                        return quest:progressEvent(4)
                    end
                end,

                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.POT_OF_MARTIAL_RELISH) then
                        return quest:event(5):oncePerZone()
                    end
                end,
            },

            onEventFinish =
            {
                [4] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, invaderXim.ki.POT_OF_MARTIAL_RELISH)
                end,
            },
        },

        [invaderXim.zone.BATALLIA_DOWNS_S] =
        {
            onZoneIn = function(player, prevZone)
                if
                    prevZone == invaderXim.zone.ROLANBERRY_FIELDS_S and
                    quest:getVar(player, 'Prog') == 2
                then
                    return 24
                end
            end,

            onEventFinish =
            {
                [24] = function(player, csid, option, npc)
                    invaderXim.wotg.helpers.checkMemoryFragments(player)
                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
