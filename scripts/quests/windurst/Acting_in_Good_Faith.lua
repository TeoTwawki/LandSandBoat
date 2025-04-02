-----------------------------------
-- Acting in Good Faith
-----------------------------------
-- !addquest 2 64
-- Gantineux : !pos -83 -9 3 238
-- Eperdur   : !pos 129 -6 96 231
-- QM1       : !pos -460.85, -1.5, 425.14 (D-5)
--           : !pos -24.10, -9.303, 258.993 (I-7)
--           : !pos -19.624,-1.631,60.368 (I-10)
--           : !pos 256.757, -20.489, 335.920 (M-6)
-----------------------------------
local eldiemeID = zones[invaderXim.zone.THE_ELDIEME_NECROPOLIS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.ACTING_IN_GOOD_FAITH)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.WINDURST,
    item     = invaderXim.item.SCROLL_OF_TELEPORT_MEA,
    title    = invaderXim.title.PILGRIM_TO_MEA,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(invaderXim.fameArea.WINDURST) >= 4 and
                player:getMainLvl() >= 10
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Gantineux'] = quest:progressEvent(10019),

            onEventFinish =
            {
                [10019] = function(player, csid, option, npc)
                    if option == 0 then
                        npcUtil.giveKeyItem(player, invaderXim.ki.SPIRIT_INCENSE)
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

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Gantineux'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.SPIRIT_INCENSE) then
                        return quest:event(10020)
                    elseif player:hasKeyItem(invaderXim.ki.GANTINEUXS_LETTER) then
                        return quest:event(10022)
                    else
                        return quest:progressEvent(10021)
                    end
                end,
            },

            onEventFinish =
            {
                [10021] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.GANTINEUXS_LETTER)
                end,
            },
        },

        [invaderXim.zone.THE_ELDIEME_NECROPOLIS] =
        {
            ['qm1'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.SPIRIT_INCENSE) then
                        return quest:progressEvent(50)
                    end
                end,
            },

            onEventFinish =
            {
                [50] = function(player, csid, option, npc)
                    player:messageSpecial(eldiemeID.text.SPIRIT_INCENSE_EMITS_PUTRID_ODOR, invaderXim.ki.SPIRIT_INCENSE)
                    player:delKeyItem(invaderXim.ki.SPIRIT_INCENSE)

                    npc:setPos(unpack(eldiemeID.npc.QM1_POS[math.random(1, 4)])) -- move QM1 randomly on quest completion
                end,
            },
        },

        [invaderXim.zone.NORTHERN_SAN_DORIA] =
        {
            ['Eperdur'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.GANTINEUXS_LETTER) then
                        return quest:progressEvent(680)
                    end
                end,
            },

            onEventFinish =
            {
                [680] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.GANTINEUXS_LETTER)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Gantineux'] = quest:event(10023):replaceDefault(),
        },
    },
}

return quest
