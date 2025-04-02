-----------------------------------
-- Trouble at the Sluice
-----------------------------------
-- Log ID: 0, Quest ID: 68
-----------------------------------
-- Belgidiveau : !pos -98 0 69 231
-- Novalmauge  : !pos 70 -24 21 167
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TROUBLE_AT_THE_SLUICE)

quest.reward =
{
    item = invaderXim.item.HEAVY_AXE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_RUMOR) == invaderXim.questStatus.QUEST_COMPLETED and
                player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 3
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Belgidiveau'] = quest:progressEvent(57),

            onEventFinish =
            {
                [57] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                not player:hasKeyItem(invaderXim.ki.NEUTRALIZER) and
                vars.Prog == 0
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Belgidiveau'] = quest:event(55),
        },

        [invaderXim.zone.BOSTAUNIEUX_OUBLIETTE] =
        {
            ['Novalmauge'] = quest:progressEvent(15),

            onEventFinish =
            {
                [15] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                not player:hasKeyItem(invaderXim.ki.NEUTRALIZER) and
                vars.Prog == 1
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Belgidiveau'] = quest:event(55),
        },

        [invaderXim.zone.BOSTAUNIEUX_OUBLIETTE] =
        {
            ['Novalmauge'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHas(trade, invaderXim.item.DAHLIA) then
                        return quest:progressEvent(17)
                    end
                end,

                onTrigger = quest:event(16),
            },

            onEventFinish =
            {
                [17] = function(player, csid, option, npc)
                    if npcUtil.giveKeyItem(player, invaderXim.ki.NEUTRALIZER) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                player:hasKeyItem(invaderXim.ki.NEUTRALIZER)
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Belgidiveau'] = quest:progressEvent(56),

            onEventFinish =
            {
                [56] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.NEUTRALIZER)
                    end
                end,
            },
        },
    },
}

return quest
