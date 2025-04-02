-----------------------------------
-- A Question of Faith
-----------------------------------
-- Area: Metalworks
-- NPC: Ayame !pos 132 -18 33 237
-- NPC: Virnage !pos 0.7 -0.0 49 234
-- NPC: Rakorok !pos 158 13 -42 11
-----------------------------------
local ID  = zones[invaderXim.zone.OLDTON_MOVALPOLOS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.A_QUESTION_OF_FAITH)

quest.reward =
{
    fame = 50,
    fameArea = invaderXim.fameArea.BASTOK,
    gil = 3000,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
            player:getFameLevel(invaderXim.fameArea.BASTOK) >= 4 and
            player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.OUT_OF_THE_DEPTHS)
        end,

        [invaderXim.zone.METALWORKS] =
        {
            ['Ayame'] = quest:progressEvent(875),

            onEventFinish =
            {
                [875] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Virnage'] =
            {
                onTrigger = function(player, npc)
                    if
                        not player:hasKeyItem(invaderXim.ki.DAWN_TALISMAN) and
                        quest:getVar(player, 'Prog') == 0
                    then
                        return quest:progressEvent(239, 0, invaderXim.ki.DAWN_TALISMAN)
                    elseif player:hasKeyItem(invaderXim.ki.DAWN_TALISMAN) then
                        return quest:event(242, 0, invaderXim.ki.DAWN_TALISMAN)
                    elseif quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(241)
                    end
                end,
            },

            onEventFinish =
            {
                [239] = function(player, csid, option, npc)
                    if option == 1 then
                        npcUtil.giveKeyItem(player, invaderXim.ki.DAWN_TALISMAN)
                    end
                end,

                [241] = function(player, csid, option, npc)
                        quest:complete(player)
                end,
            },
        },

        [invaderXim.zone.OLDTON_MOVALPOLOS] =
        {
            ['Rakorok'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DAWN_TALISMAN) and
                        quest:getVar(player, 'Prog') == 0
                    then
                        if npcUtil.popFromQM(player, npc, ID.mob.BUGALLUG, { claim = true, hide = 0 }) then
                            player:messageSpecial(ID.text.ALTANA_DIE)
                            return quest:messageSpecial(ID.text.MONSTER_APPEARED)
                        end
                    elseif
                        quest:getVar(player, 'Prog') == 1 and
                        player:hasKeyItem(invaderXim.ki.DAWN_TALISMAN)
                    then
                        return quest:progressEvent(6, 11, invaderXim.ki.DAWN_TALISMAN)
                    end
                end,
            },

            ['Bugallug'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if quest:getVar(player, 'Prog') == 0 then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,
            },

            onEventFinish =
            {
                [6] = function(player, csid, option, npc)
                    player:delKeyItem(invaderXim.ki.DAWN_TALISMAN)
                    player:messageSpecial(ID.text.WAS_TAKEN_FROM_YOU, 0, invaderXim.ki.DAWN_TALISMAN)
                end,
            },
        },
    },
}

return quest
