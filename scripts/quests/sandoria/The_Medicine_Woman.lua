-----------------------------------
-- The Medicine Woman
-----------------------------------
-- Log ID: 0, Quest ID: 30
-- Abeaule : !pos -136 -2 56 231
-- Amaura  : !pos -85 -6 89 230
-----------------------------------
local northernSandoriaID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
local southernSandoriaID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_MEDICINE_WOMAN)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.SANDORIA,
    gil      = 2100,
    title    = invaderXim.title.TRAVELING_MEDICINE_MAN,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_TRADER_IN_THE_FOREST) and
                player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 3
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Abeaule'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 0 then
                        return quest:progressEvent(613)
                    else
                        return quest:progressEvent(615)
                    end
                end,
            },

            onEventFinish =
            {
                [613] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    else
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                [615] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                        quest:setVar(player, 'Prog', 0)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Abeaule'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.COLD_MEDICINE) then
                        return quest:progressEvent(614)
                    else
                        return quest:messageText(northernSandoriaID.text.ABEAULE_DIALOG_HOME)
                    end
                end,
            },

            onEventFinish =
            {
                [614] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.COLD_MEDICINE)
                    end
                end,
            },
        },

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Amaura'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        player:hasKeyItem(invaderXim.ki.AMAURAS_FORMULA) and
                        npcUtil.tradeHasExactly(trade, { invaderXim.item.MALBORO_VINE, invaderXim.item.CHUNK_OF_ZINC_ORE, invaderXim.item.INSECT_WING })
                    then
                        return quest:progressEvent(637)
                    end
                end,

                onTrigger = function(player, npc)
                    local hasFormula = player:hasKeyItem(invaderXim.ki.AMAURAS_FORMULA)
                    local hasColdMedicine = player:hasKeyItem(invaderXim.ki.COLD_MEDICINE)

                    if
                        not hasFormula and
                        not hasColdMedicine
                    then
                        return quest:progressEvent(636)
                    elseif hasFormula then
                        return quest:messageText(southernSandoriaID.text.AMAURA_DIALOG_COMEBACK)
                    elseif hasColdMedicine then
                        return quest:messageText(southernSandoriaID.text.AMAURA_DIALOG_DELIVER)
                    end
                end,
            },

            onEventFinish =
            {
                [636] = function(player, csid, option, npc)
                    if option == 0 then
                        npcUtil.giveKeyItem(player, invaderXim.ki.AMAURAS_FORMULA)
                    end
                end,

                [637] = function(player, csid, option, npc)
                    player:confirmTrade()
                    player:delKeyItem(invaderXim.ki.AMAURAS_FORMULA)
                    npcUtil.giveKeyItem(player, invaderXim.ki.COLD_MEDICINE)
                end,
            },
        },
    },
}

return quest
