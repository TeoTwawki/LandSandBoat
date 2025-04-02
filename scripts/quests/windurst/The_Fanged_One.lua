-----------------------------------
-- The Fanged One
-----------------------------------
-- Log ID: 2, Quest ID: 31
-- Perih Vashai: !pos 117 -3 92 241
-- Tiger Bones: !pos 666 -8 -379 120
-- Keeping Old Sabertooth and Tiger Bones in separate lua's due to special functions.
-----------------------------------
local windurstWoodsID = zones[invaderXim.zone.WINDURST_WOODS]
local sauromugueID    = zones[invaderXim.zone.SAUROMUGUE_CHAMPAIGN]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_FANGED_ONE)

quest.reward =
{
    fame     = 20,
    fameArea = invaderXim.fameArea.WINDURST,
    item     = invaderXim.item.RANGERS_NECKLACE,
    title    = invaderXim.title.THE_FANGED_ONE,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
            player:getMainLvl() >= invaderXim.settings.main.ADVANCED_JOB_LEVEL
        end,

        [invaderXim.zone.WINDURST_WOODS] =
        {
            ['Perih_Vashai'] = quest:progressEvent(351),

            onEventFinish =
            {
                [351] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.WINDURST_WOODS] =
        {
            ['Perih_Vashai'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:event(352)
                    elseif
                        quest:getVar(player, 'Prog') == 1 and
                        not player:hasKeyItem(invaderXim.ki.OLD_TIGERS_FANG)
                    then
                        return quest:event(356)
                    elseif player:hasKeyItem(invaderXim.ki.OLD_TIGERS_FANG) then
                        return quest:progressEvent(357)
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.BLACK_TIGER_FANG) then
                        return quest:event(356)
                    end
                end,
            },

            ['Kapeh_Myohrye'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(354)
                end,
            },

            ['Muhk_Johldy'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(353)
                end,
            },

            onEventFinish =
            {
                [356] = function(player, csid, option, npc)
                    player:tradeComplete() -- capture shows taking black tiger fang if traded.
                end,

                [357] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.OLD_TIGERS_FANG)
                        player:unlockJob(invaderXim.job.RNG)
                        npcUtil.giveKeyItem(player, invaderXim.ki.JOB_GESTURE_RANGER)
                        player:messageSpecial(windurstWoodsID.text.PERIH_VASHAI_DIALOG)
                    end
                end,
            },
        },

        [invaderXim.zone.SAUROMUGUE_CHAMPAIGN] =
        -- The logic for this specific mechanic is unique. Therefore, the mob logic and onMobDeath
        -- resides in the Old_Sabertooth.lua onMobSpawn, onMobFight, and onMobDeath.
        -- Currently, unable to have the onMobDeath function load from this file due to enmity.
        -- Issue was raised to IXIM for consideration on how to adjust moving forward.
        {
            ['Tiger_Bones'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 0 and
                        quest:getVar(player, 'Timer') <= os.time() and
                        not GetMobByID(sauromugueID.mob.OLD_SABERTOOTH):isSpawned()
                    then
                        SpawnMob(sauromugueID.mob.OLD_SABERTOOTH):addStatusEffect(invaderXim.effect.POISON, 10, 10, 240)
                        return quest:messageSpecial(sauromugueID.text.OLD_SABERTOOTH_DIALOG_I)
                    elseif
                        quest:getVar(player, 'Prog') == 1 and -- listeners for damage and onMobDeath actions are in Old_Sabtertooth.lua
                        not player:hasKeyItem(invaderXim.ki.OLD_TIGERS_FANG)
                    then
                        npcUtil.giveKeyItem(player, invaderXim.ki.OLD_TIGERS_FANG)
                        return quest:noAction()
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.WINDURST_WOODS] =
        {
            ['Perih_Vashai'] = quest:event(348):replaceDefault(),
        },
    },
}

return quest
