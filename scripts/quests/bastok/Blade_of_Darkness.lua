-----------------------------------
-- Blade of Darkness
-----------------------------------
-- Log ID: 1, Quest ID: 28
-- Gumbah : !pos 52 0 -36 234
-- TODO: This quest needs verification!
-----------------------------------
local beadeauxID = zones[invaderXim.zone.BEADEAUX]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.BLADE_OF_DARKNESS)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.BASTOK,
    title    = invaderXim.title.DARK_SIDER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL
        end,

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Gumbah'] = quest:progressEvent(99),

            onEventFinish =
            {
                [99] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.ZERUHN_MINES] =
        {
            onZoneIn = function(player, prevZone)
                if prevZone == invaderXim.zone.PALBOROUGH_MINES then
                    if quest:getVar(player, 'Prog') == 0 then
                        return 130
                    elseif not player:hasItem(invaderXim.item.CHAOSBRINGER) then
                        return 131
                    end
                end
            end,

            onEventFinish =
            {
                [130] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.CHAOSBRINGER) then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                [131] = function(player, csid, option, npc)
                    npcUtil.giveItem(player, invaderXim.item.CHAOSBRINGER)
                end,
            },
        },

        [invaderXim.zone.BEADEAUX] =
        {
            onZoneIn = function(player, prevZone)
                if
                    prevZone == invaderXim.zone.PASHHOW_MARSHLANDS and
                    player:getCharVar('ChaosbringerKills') >= 100
                then
                    return 121
                end
            end,

            onEventFinish =
            {
                [121] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:unlockJob(invaderXim.job.DRK)
                        player:messageSpecial(beadeauxID.text.YOU_CAN_NOW_BECOME_A_DARK_KNIGHT)
                    end
                end,
            },
        },
    },
}

return quest
