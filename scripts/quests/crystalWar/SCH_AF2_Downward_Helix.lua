-----------------------------------
-- Downward Helix
-----------------------------------
-- !addquest 7 33
-- Erlene              : !pos 376.936 -39.999 17.914 175
-- Indescript Markings : !pos 322 24 113 98
-----------------------------------

local quest = Quest:new(invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.DOWNWARD_HELIX)

quest.reward =
{
    item = invaderXim.item.SCHOLARS_BRACERS
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                invaderXim.quest.getVar(player, invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.ON_SABBATICAL, 'Timer') <= VanadielUniqueDay() and
                player:getMainJob() == invaderXim.job.SCH and
                player:getMainLvl() >= invaderXim.settings.main.AF2_QUEST_LEVEL
        end,

        [invaderXim.zone.THE_ELDIEME_NECROPOLIS_S] =
        {
            ['Erlene'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(23)
                end
            },

            onEventFinish =
            {
                [23] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            }
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.SOUTHERN_SAN_DORIA_S] =
        {
            onZoneIn = function(player, prevZone)
                if
                    prevZone == invaderXim.zone.EAST_RONFAURE_S and
                    quest:getVar(player, 'Prog') == 0
                then
                    return 65
                end
            end,

            onEventFinish =
            {
                [65] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
            }
        },

        [invaderXim.zone.THE_ELDIEME_NECROPOLIS_S] =
        {
            ['Erlene'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')
                    if questProgress == 1 then
                        return quest:progressEvent(25)
                    elseif questProgress == 0 then
                        return quest:progressEvent(24)
                    elseif questProgress < 4 then
                        return quest:progressEvent(26)
                    else
                        return quest:progressEvent(27)
                    end
                end
            },

            onEventFinish =
            {
                [25] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,

                [27] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        invaderXim.quest.setVar(player, invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.DOWNWARD_HELIX, 'Timer', VanadielUniqueDay() + 1)
                        invaderXim.quest.setMustZone(player, invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.DOWNWARD_HELIX)
                    end
                end,
            }
        },

        [invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S] =
        {
            onZoneIn = function(player, prevZone)
                if
                    prevZone == invaderXim.zone.ROLANBERRY_FIELDS_S and
                    quest:getVar(player, 'Prog') == 2
                then
                    return 3
                end
            end,

            ['Indescript_Markings'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 3 then
                        return quest:progressEvent(4)
                    end
                end,
            },

            onEventFinish =
            {
                [3] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                end,

                [4] = function(player, csid, option, npc)
                    if npcUtil.giveKeyItem(player, invaderXim.ki.ULBRECHTS_MORTARBOARD) then
                        quest:setVar(player, 'Prog', 4)
                    end
                end,
            }
        },

    },
}

return quest
