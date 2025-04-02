-----------------------------------
-- Chips
-----------------------------------
-- Log ID: 1, Quest ID: 82
-----------------------------------
-- CoP 6-4        : !addmission 6 638
-- CoP 7-1        : !addmission 6 648
-- Ghebi Damomohe : !pos 15.535 -0.111 -7.603
-- Cid            : !pos -12 -12 1 237
-----------------------------------
local metalID = zones[invaderXim.zone.METALWORKS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.CHIPS)

quest.reward =
{
    item = invaderXim.item.CCB_POLYMER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.LOWER_JEUNO] =
        {
            ['Ghebi_Damomohe'] =
            {
                onTrigger = function(player, npc)
                    if
                        not quest:getMustZone(player) and
                        (player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.ONE_TO_BE_FEARED) or
                        (player:getCurrentMission(invaderXim.mission.log_id.COP) == invaderXim.mission.id.cop.ONE_TO_BE_FEARED and
                        invaderXim.mission.getVar(player, invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.ONE_TO_BE_FEARED, 'Status') >= 1))
                    then
                        return quest:progressEvent(169)
                    end
                end,
            },

            onEventFinish =
            {
                [169] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    elseif option == 1 then
                        quest:setMustZone(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Cid'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { invaderXim.item.CARMINE_CHIP, invaderXim.item.CYAN_CHIP, invaderXim.item.GRAY_CHIP }) then
                        if
                            player:getFreeSlotsCount() == 0 or
                            player:hasItem(invaderXim.item.CCB_POLYMER)
                        then
                            return player:messageSpecial(metalID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.CCB_POLYMER)
                        else
                            return quest:progressEvent(883)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [883] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Cid'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { invaderXim.item.CARMINE_CHIP, invaderXim.item.CYAN_CHIP, invaderXim.item.GRAY_CHIP }) then
                        if
                            player:getFreeSlotsCount() == 0 or
                            player:hasItem(invaderXim.item.CCB_POLYMER)
                        then
                            return player:messageSpecial(metalID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.CCB_POLYMER)
                        else
                            return quest:progressEvent(884)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [884] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
