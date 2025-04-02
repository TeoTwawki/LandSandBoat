-----------------------------------
-- A Purchase of Arms
-----------------------------------
-- Log ID: 0, Quest ID: 27
-----------------------------------
-- Helbort : !pos 71 -1 65 230
-- Alexius : !pos 105 1 382 104
-----------------------------------
local forestID = zones[invaderXim.zone.JUGNER_FOREST]
local southID  = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_PURCHASE_OF_ARMS)

quest.reward =
{
    item  = invaderXim.item.ELM_STAFF,
    title = invaderXim.title.ARMS_TRADER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.FATHER_AND_SON) == invaderXim.questStatus.QUEST_COMPLETED and
                player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 2
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Helbort'] = quest:progressEvent(594),

            onEventFinish =
            {
                [594] = function(player, csid, option, npc)
                    if option == 0 and npcUtil.giveKeyItem(player, invaderXim.ki.WEAPONS_ORDER) then
                        quest:begin(player)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasKeyItem(invaderXim.ki.WEAPONS_ORDER)
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Helbort'] = quest:message(southID.text.HELBORT_ORDERS),
        },

        [invaderXim.zone.JUGNER_FOREST] =
        {
            ['Alexius'] = quest:progressEvent(5),

            onEventFinish =
            {
                [5] = function(player, csid, option, npc)
                    if npcUtil.giveKeyItem(player, invaderXim.ki.WEAPONS_RECEIPT) then
                        player:delKeyItem(invaderXim.ki.WEAPONS_ORDER)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                not player:hasKeyItem(invaderXim.ki.WEAPONS_ORDER)
        end,

        [invaderXim.zone.JUGNER_FOREST] =
        {
            ['Alexius'] = quest:message(forestID.text.ALIXIMUS_ORDERS, invaderXim.ki.WEAPONS_RECEIPT),
        },

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Helbort'] = quest:progressEvent(607),

            onEventFinish =
            {
                [607] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.WEAPONS_RECEIPT)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Helbort'] = quest:message(southID.text.HELBORT_ORDERS + 3)
        },
    },
}

return quest
