-----------------------------------
-- Whence Blows the Wind
-----------------------------------
-- Log ID: 3, Quest ID: 130
-- Maat : !pos 8 3 118 243
-- qm1 (Monastic Caverns) : !pos 168 -1 -22 150
-- qm2 (Castle Oztroja)   : !pos -100 -63 58 151
-- qm1 (Qulun Dome)       : !pos 261 39 79 148
-----------------------------------
local ruludeID = zones[invaderXim.zone.RULUDE_GARDENS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.WHENCE_BLOWS_THE_WIND)

quest.reward =
{
    fame = 50,
    fameArea = invaderXim.fameArea.JEUNO,
    title = invaderXim.title.SKY_BREAKER,
}

quest.sections =
{
    -- Section: Quest available.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getLevelCap() == 60 and
                invaderXim.settings.main.MAX_LEVEL >= 65
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    if player:getMainLvl() >= 56 then
                        return quest:progressEvent(85)
                    else
                        return quest:messageText(ruludeID.text.MAAT_LB3_PLACEHOLDER)
                    end
                end,
            },

            onEventFinish =
            {
                [85] = function(player, csid, option, npc)
                    if option == 1 then -- Accept quest option.
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    -- Section: Quest accepted.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.ORCISH_CREST) and
                        player:hasKeyItem(invaderXim.ki.QUADAV_CREST) and
                        player:hasKeyItem(invaderXim.ki.YAGUDO_CREST)
                    then
                        return quest:progressEvent(87)
                    else
                        return quest:event(86)
                    end
                end,
            },

            onEventFinish =
            {
                [87] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.ORCISH_CREST)
                        player:delKeyItem(invaderXim.ki.QUADAV_CREST)
                        player:delKeyItem(invaderXim.ki.YAGUDO_CREST)
                        player:setLevelCap(65)
                        player:messageSpecial(ruludeID.text.YOUR_LEVEL_LIMIT_IS_NOW_65)
                    end
                end,
            },
        },

        [invaderXim.zone.CASTLE_OZTROJA] =
        {
            ['qm2'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.YAGUDO_CREST) then
                        return quest:keyItem(invaderXim.ki.YAGUDO_CREST)
                    end
                end,
            },
        },

        [invaderXim.zone.MONASTIC_CAVERN] =
        {
            ['qm1'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.ORCISH_CREST) then
                        return quest:keyItem(invaderXim.ki.ORCISH_CREST)
                    end
                end,
            },
        },

        [invaderXim.zone.QULUN_DOME] =
        {
            ['qm1'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.QUADAV_CREST) then
                        return quest:keyItem(invaderXim.ki.QUADAV_CREST)
                    end
                end,
            },
        },
    },
}

return quest
