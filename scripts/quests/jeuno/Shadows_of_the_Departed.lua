-----------------------------------
-- Shadows of the Departed
-----------------------------------
-- Log ID: 3, Quest ID: 88
-- _0id : !pos 220 -2.5 340 18
-- _0gc : !pos 100.005 -3.028 -140.005 16
-- _0k0 : !pos 260 -2.5 180 20
-----------------------------------
local ruludeID = zones[invaderXim.zone.RULUDE_GARDENS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.STORMS_OF_FATE) and
                player:getCurrentMission(invaderXim.mission.log_id.ZILART) == invaderXim.mission.id.zilart.AWAKENING and
                player:getMissionStatus(invaderXim.mission.log_id.ZILART) == 3 and
                VanadielUniqueDay() >= vars.Timer
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    return quest:progressEvent(161)
                end,
            },

            onEventFinish =
            {
                [161] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.NOTE_WRITTEN_BY_ESHANTARL)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.PROMYVION_DEM] =
        {
            ['_0id'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.PROMYVION_DEM_SLIVER) then
                        return quest:keyItem(invaderXim.ki.PROMYVION_DEM_SLIVER)
                    end
                end,
            },
        },

        [invaderXim.zone.PROMYVION_HOLLA] =
        {
            ['_0gc'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.PROMYVION_HOLLA_SLIVER) then
                        return quest:keyItem(invaderXim.ki.PROMYVION_HOLLA_SLIVER)
                    end
                end,
            },
        },

        [invaderXim.zone.PROMYVION_MEA] =
        {
            ['_0k0'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.PROMYVION_MEA_SLIVER) then
                        return quest:keyItem(invaderXim.ki.PROMYVION_MEA_SLIVER)
                    end
                end,
            },
        },

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    for keyItemId = invaderXim.ki.PROMYVION_HOLLA_SLIVER, invaderXim.ki.PROMYVION_HOLLA_SLIVER + 2 do
                        if not player:hasKeyItem(keyItemId) then
                            return
                        end
                    end

                    return quest:progressEvent(162)
                end,
            },

            onEventFinish =
            {
                [162] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        for keyItemId = invaderXim.ki.PROMYVION_HOLLA_SLIVER, invaderXim.ki.PROMYVION_HOLLA_SLIVER + 2 do
                            player:delKeyItem(keyItemId)
                        end

                        player:messageSpecial(ruludeID.text.YOU_HAND_THE_THREE_SLIVERS)

                        invaderXim.quest.setVar(player, invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.APOCALYPSE_NIGH, 'Timer', VanadielUniqueDay() + 1)
                        invaderXim.quest.setMustZone(player, invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.APOCALYPSE_NIGH)
                    end
                end,
            },
        },
    },
}

return quest
