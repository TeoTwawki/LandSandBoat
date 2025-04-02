-----------------------------------
-- A Squire's Test
-----------------------------------
-- Log ID: 0, Quest ID: 10
-- Balasiel : !pos -136 -11 64 230
-----------------------------------
local southernSandoriaID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_SQUIRES_TEST)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.SANDORIA,
    item     = invaderXim.item.SPATHA,
    title    = invaderXim.title.KNIGHT_IN_TRAINING,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Balasiel'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Option') == 0 then
                        return quest:progressEvent(616)
                    else
                        return quest:progressEvent(631)
                    end
                end,
            },

            onEventFinish =
            {
                [616] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    else
                        quest:setVar(player, 'Option', 1)
                    end
                end,

                [631] = function(player, csid, option, npc)
                    if option == 0 then
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

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Balasiel'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.REVIVAL_TREE_ROOT) then
                        return quest:progressEvent(617)
                    end
                end,

                onTrigger = quest:messageName(southernSandoriaID.text.GO_TO_KING_RANPERRES, invaderXim.item.REVIVAL_TREE_ROOT),
            },

            onEventFinish =
            {
                [617] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
