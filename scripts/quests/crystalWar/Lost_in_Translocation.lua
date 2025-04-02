-----------------------------------
-- Lost in Translocation
-----------------------------------
-- !addquest 7 0
-- Thorben     : !pos 175.346 8.038 -419.244 84
-- Erik        : !pos 258.643 -33.249 99.901 175
-- Gravestone  : !pos 254.428 -32.999 20.001 175
-- Sarcophagus : !pos 336.594 -33.500 -56.728 175
-----------------------------------

local quest = Quest:new(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.LOST_IN_TRANSLOCATION)

quest.reward =
{
    gil     = 2000,
    exp     = 2000,
    keyItem = invaderXim.ki.MAP_OF_GRAUBERG,
}

local mapKeyItems =
{
    invaderXim.ki.LEFT_MAP_PIECE,
    invaderXim.ki.MIDDLE_MAP_PIECE,
    invaderXim.ki.RIGHT_MAP_PIECE,
}

local function getNumMapPieces(player)
    local numKeyItems = 0

    for _, keyItem in ipairs(mapKeyItems) do
        if player:hasKeyItem(keyItem) then
            numKeyItems = numKeyItems + 1
        end
    end

    return numKeyItems
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.BATALLIA_DOWNS_S] =
        {
            ['Thorben'] = quest:progressEvent(103),

            onEventFinish =
            {
                [103] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.BATALLIA_DOWNS_S] =
        {
            ['Thorben'] =
            {
                onTrigger = function(player, npc)
                    local numMapPieces = getNumMapPieces(player)

                    if numMapPieces == 3 then
                        return quest:progressEvent(107)
                    elseif quest:getVar(player, 'Option') == 1 then
                        return quest:event(106)
                    elseif numMapPieces > 0 then
                        return quest:progressEvent(105)
                    else
                        return quest:event(104)
                    end
                end,
            },

            onEventFinish =
            {
                [105] = function(player, csid, option, npc)
                    quest:setVar(player, 'Option', 1)
                end,

                [107] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.LEFT_MAP_PIECE)
                        player:delKeyItem(invaderXim.ki.MIDDLE_MAP_PIECE)
                        player:delKeyItem(invaderXim.ki.RIGHT_MAP_PIECE)
                    end
                end,
            },
        },

        [invaderXim.zone.THE_ELDIEME_NECROPOLIS_S] =
        {
            ['Erik'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.LEFT_MAP_PIECE) then
                        return quest:progressEvent(3)
                    end
                end,
            },

            ['Gravestone'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.MIDDLE_MAP_PIECE) then
                        return quest:progressEvent(4)
                    end
                end,
            },

            ['Sarcophagus_map_quest'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.RIGHT_MAP_PIECE) then
                        return quest:progressEvent(5)
                    end
                end,
            },

            onEventFinish =
            {
                [3] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.LEFT_MAP_PIECE)
                end,

                [4] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.MIDDLE_MAP_PIECE)
                end,

                [5] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.RIGHT_MAP_PIECE)
                end,
            },
        },
    },
}

return quest
