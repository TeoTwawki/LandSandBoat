-----------------------------------
-- Father and Son
-----------------------------------
-- Log ID: 0, Quest ID: 4
-- Ailbeche : !pos 4 -1 24 231
-- Exoroche : !pos 72 -1 60 230
-- Helbort  : !pos 71 -1 65 230
-----------------------------------
local northenSandoriaID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
local southernSandoriaID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.FATHER_AND_SON)

quest.reward =
{
    fame = 30,
    fameArea = invaderXim.fameArea.SANDORIA,
    item = invaderXim.item.WILLOW_FISHING_ROD,
    title = invaderXim.title.LOST_CHILD_OFFICER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Exoroche'] =
            {
                onTrigger = function(player, npc)
                    if math.random(100) < 30 then
                        return quest:message(southernSandoriaID.text.EXOROCHE_START)
                    else
                        return quest:message(southernSandoriaID.text.EXOROCHE_DIALOG_OFFSET + math.random(0, 5))
                    end
                end,
            },

            ['Helbort'] = quest:event(593):oncePerZone(),
        },

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Ailbeche'] = quest:progressEvent(508),

            onEventFinish =
            {
                [508] = function(player, csid, option, npc)
                    quest:begin(player)
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
            ['Ailbeche'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(509)
                    else
                        return quest:message(northenSandoriaID.text.AILBECHE_FATHER_WHERE):progress()
                    end
                end,
            },

            onEventFinish =
            {
                [509] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Helbort'] = quest:event(593):oncePerZone(),

            ['Exoroche'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(542)
                    else
                        return quest:message(southernSandoriaID.text.EXOROCHE_PLEASE_TELL):progress()
                    end
                end,
            },

            onEventFinish =
            {
                [542] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.SHARPENING_THE_SWORD) == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Ailbeche'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        not player:hasTitle(invaderXim.title.FAMILY_COUNSELOR) and
                        npcUtil.tradeHasExactly(trade, invaderXim.item.WILLOW_FISHING_ROD)
                    then
                        return quest:progressEvent(61)
                    end
                end,

                onTrigger = function(player, npc)
                    if player:hasTitle(invaderXim.title.FAMILY_COUNSELOR) then
                        return quest:message(northenSandoriaID.text.AILBECHE_WHEN_FISHING):replaceDefault()
                    else
                        npc:showText(npc, northenSandoriaID.text.OH_I_WANT_MY_ITEM, invaderXim.item.WILLOW_FISHING_ROD)
                        return quest:noAction():progress()
                    end
                end,
            },

            onEventFinish =
            {
                [61] = function(player, csid, option, npc)
                    player:confirmTrade()
                    player:addTitle(invaderXim.title.FAMILY_COUNSELOR)
                end,
            },
        },
    },
}

return quest
