-----------------------------------
-- Rock Bottom
-- !pos 838.243 -14.475 231.871 61
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.ROCK_BOTTOM)

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.MOUNT_ZHAYOLM] =
        {
            ['blank11'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(7)
                end,
            },

            onEventFinish =
            {
                [7] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                    quest:begin(player)
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.MOUNT_ZHAYOLM] =
        {
            ['blank11'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        quest:getVar(player, 'Prog') == 1 and
                        npcUtil.tradeHasExactly(trade, invaderXim.item.PICKAXE)
                    then
                        return quest:progressEvent(8)
                    elseif
                        not player:needToZone() and
                        quest:getVar(player, 'Prog') == 2 and
                        npcUtil.tradeHas(trade, { invaderXim.item.MYTHRIL_PICK, invaderXim.item.MYTHRIL_PICK_HQ }, true)
                    then
                        return quest:progressEvent(9, { [0] = trade:getItemId() })
                    end
                end,

                onTrigger = function(player, npc)
                    return quest:messageSpecial(zones[player:getZoneID()].text.NOTHING_HAPPENS)
                end,
            },

            onEventFinish =
            {
                [8] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                    player:needToZone(true)
                end,

                [9] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:tradeComplete()
                        npcUtil.giveKeyItem(player, invaderXim.ki.MAP_OF_MOUNT_ZHAYOLM)
                    end
                end,
            },
        },
    },
}

return quest
