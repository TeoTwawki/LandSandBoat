-----------------------------------
-- Stop Your Whining
-----------------------------------
-- Log ID: 5, Quest ID: 132
-- Washu : !pos 49 -6 15 252
-- qm2   : !pos -94.073 -0.999 22.295 124
-----------------------------------
local yhoatorID = zones[invaderXim.zone.YHOATOR_JUNGLE]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.STOP_YOUR_WHINING)

quest.reward =
{
    item = invaderXim.item.SCROLL_OF_HOJO_ICHI,
    fameArea = invaderXim.fameArea.NORG,
    fame = 75,
    title = invaderXim.title.APPRENTICE_SOMMELIER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.NORG) >= 4 and
                player:getMainLvl() >= 10
        end,

        [invaderXim.zone.NORG] =
        {
            ['Washu'] = quest:progressEvent(21),

            onEventFinish =
            {
                [21] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, invaderXim.ki.EMPTY_BARREL)
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
            ['Washu'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.EMPTY_BARREL) then
                        return quest:progressEvent(22)
                    elseif player:hasKeyItem(invaderXim.ki.BARREL_OF_OPO_OPO_BREW) then
                        return quest:progressEvent(23)
                    end
                end,
            },

            onEventFinish =
            {
                [23] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.BARREL_OF_OPO_OPO_BREW)
                    end
                end,
            },
        },

        [invaderXim.zone.YHOATOR_JUNGLE] =
        {
            ['qm2'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.EMPTY_BARREL) then
                        player:messageSpecial(yhoatorID.text.TREE_CHECK)
                        player:delKeyItem(invaderXim.ki.EMPTY_BARREL)
                        return quest:keyItem(invaderXim.ki.BARREL_OF_OPO_OPO_BREW)
                    elseif player:hasKeyItem(invaderXim.ki.BARREL_OF_OPO_OPO_BREW) then
                        return quest:messageSpecial(yhoatorID.text.TREE_FULL)
                    end
                end,
            }
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.NORG] =
        {
            ['Washu'] = quest:event(24):replaceDefault(),
        },
    },
}

return quest
