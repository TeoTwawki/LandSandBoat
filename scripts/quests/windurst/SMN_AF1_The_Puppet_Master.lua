-----------------------------------
-- The Puppet Master
-----------------------------------
-- Log ID: 2, Quest ID: 81
-- House of the Hero (_6n2) : !pos -26 -13 260 239
-- Juroro                   : !pos 32 7 -41 236
-- Koru-Moru                : !pos -120 -6 124 239
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_PUPPET_MASTER)

quest.reward =
{
    fame     = 20,
    fameArea = invaderXim.fameArea.WINDURST,
    item     = invaderXim.item.KUKULCANS_STAFF,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= invaderXim.settings.main.AF1_QUEST_LEVEL and
                player:getMainJob() == invaderXim.job.SMN and
                not quest:getMustZone(player)
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['_6n2'] = quest:progressEvent(402),

            onEventFinish =
            {
                [402] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['_6n2'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:event(403)
                    end
                end,
            },

            ['Koru-Moru'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 3 then
                        return quest:progressEvent(404)
                    end
                end,
            },

            onEventFinish =
            {
                [404] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        invaderXim.quest.setMustZone(player, invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CLASS_REUNION)
                    end
                end,
            },
        },

        [invaderXim.zone.PORT_BASTOK] =
        {
            ['Juroro'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 0 then
                        return quest:progressEvent(256, 0, 329, 0, invaderXim.item.EARTH_PENDULUM)
                    elseif
                        questProgress == 1 and
                        not player:hasItem(invaderXim.item.EARTH_PENDULUM)
                    then
                        return quest:progressEvent(257, 0, invaderXim.item.EARTH_PENDULUM)
                    elseif questProgress == 2 then
                        return quest:progressEvent(258)
                    end
                end,
            },

            onEventFinish =
            {
                [256] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.EARTH_PENDULUM) then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                [257] = function(player, csid, option, npc)
                    npcUtil.giveItem(player, invaderXim.item.EARTH_PENDULUM)
                end,

                [258] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                end,
            },
        },

        [invaderXim.zone.CLOISTER_OF_TREMORS] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.PUPPET_MASTER and
                        quest:getVar(player, 'Prog') == 1
                    then
                        quest:setVar(player, 'Prog', 2)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                not player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CLASS_REUNION)
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Koru-Moru'] = quest:event(405):replaceDefault(),
        },
    },
}

return quest
