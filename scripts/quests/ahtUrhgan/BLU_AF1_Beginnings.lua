-----------------------------------
-- Beginnings
-----------------------------------
-- Log ID: 6, Quest ID: 21
-- Waoud   : !pos 65 -6 -78 50
-- Daswil  : !pos -208.720 -12.889 -779.713 52
-- Meyaada : !pos 22.446 -7.920 573.390 54
-- Nahshib : !pos -274.334 -9.287 -64.255 79
-- Nareema : !pos 518.387 -24.707 -467.297 79
-- Waudeen : !pos 673.882 -23.995 367.604 61
-----------------------------------
local whitegateID = zones[invaderXim.zone.AHT_URHGAN_WHITEGATE]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.BEGINNINGS)

quest.reward =
{
    item = invaderXim.item.IMMORTALS_SCIMITAR,
}

local brandKeyItems =
{
    invaderXim.ki.BRAND_OF_THE_SPRINGSERPENT,
    invaderXim.ki.BRAND_OF_THE_GALESERPENT,
    invaderXim.ki.BRAND_OF_THE_FLAMESERPENT,
    invaderXim.ki.BRAND_OF_THE_SKYSERPENT,
    invaderXim.ki.BRAND_OF_THE_STONESERPENT,
}

local function hasRequiredBrands(player)
    for _, keyItem in ipairs(brandKeyItems) do
        if not player:hasKeyItem(keyItem) then
            return false
        end
    end

    return true
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.IMMORTAL_SENTRIES) and
                player:hasCompletedQuest(invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.AN_EMPTY_VESSEL) and
                player:getMainJob() == invaderXim.job.BLU and
                player:getMainLvl() >= invaderXim.settings.main.AF1_QUEST_LEVEL and
                invaderXim.quest.getVar(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.AN_EMPTY_VESSEL, 'completeEvent') == 0
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Waoud'] =
            {
                onTrigger = function(player, npc)
                    local lastDivination = invaderXim.quest.getVar(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.AN_EMPTY_VESSEL, 'Timer')

                    if
                        lastDivination <= VanadielUniqueDay() and
                        not quest:getMustZone(player)
                    then
                        return quest:progressEvent(705)
                    end
                end,
            },

            onEventFinish =
            {
                [705] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)

                        invaderXim.quest.setVar(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.BEGINNINGS, 'Timer', VanadielUniqueDay() + 1)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                player:getMainJob() == invaderXim.job.BLU
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Waoud'] =
            {
                onTrigger = function(player, npc)
                    local lastDivination = invaderXim.quest.getVar(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.AN_EMPTY_VESSEL, 'Timer')

                    if hasRequiredBrands(player) then
                        return quest:progressEvent(707)
                    elseif lastDivination <= VanadielUniqueDay() then
                        return quest:progressEvent(706, player:getGil())
                    end
                end,
            },

            onEventFinish =
            {
                [706] = function(player, csid, option, npc)
                    if
                        option == 1 and
                        player:getGil() >= 1000
                    then
                        player:delGil(1000)
                        player:messageSpecial(whitegateID.text.PAY_DIVINATION)

                        invaderXim.quest.setVar(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.BEGINNINGS, 'Timer', VanadielUniqueDay() + 1)
                    end
                end,

                [707] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        invaderXim.quest.setVar(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.BEGINNINGS, 'Timer', VanadielUniqueDay() + 1)
                        invaderXim.quest.setMustZone(player, invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.OMENS)
                    end
                end,
            },
        },

        [invaderXim.zone.ARRAPAGO_REEF] =
        {
            ['Meyaada'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.BRAND_OF_THE_SPRINGSERPENT) then
                        return quest:progressEvent(10)
                    else
                        return quest:event(11):importantEvent()
                    end
                end,
            },

            onEventFinish =
            {
                [10] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.BRAND_OF_THE_SPRINGSERPENT)
                end,
            },
        },

        [invaderXim.zone.BHAFLAU_THICKETS] =
        {
            ['Daswil'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.BRAND_OF_THE_SKYSERPENT) then
                        return quest:progressEvent(8)
                    else
                        return quest:event(9):importantEvent()
                    end
                end,
            },

            onEventFinish =
            {
                [8] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.BRAND_OF_THE_SKYSERPENT)
                end,
            },
        },

        [invaderXim.zone.CAEDARVA_MIRE] =
        {
            ['Nahshib'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.BRAND_OF_THE_GALESERPENT) then
                        return quest:progressEvent(10)
                    else
                        return quest:event(11):importantEvent()
                    end
                end,
            },

            ['Nareema'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.BRAND_OF_THE_STONESERPENT) then
                        return quest:progressEvent(12)
                    else
                        return quest:event(13):importantEvent()
                    end
                end,
            },

            onEventFinish =
            {
                [10] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.BRAND_OF_THE_GALESERPENT)
                end,

                [12] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.BRAND_OF_THE_STONESERPENT)
                end,
            },
        },

        [invaderXim.zone.MOUNT_ZHAYOLM] =
        {
            ['Waudeen'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(invaderXim.ki.BRAND_OF_THE_FLAMESERPENT) then
                        return quest:progressEvent(10)
                    else
                        return quest:event(11):importantEvent()
                    end
                end,
            },

            onEventFinish =
            {
                [10] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, invaderXim.ki.BRAND_OF_THE_FLAMESERPENT)
                end,
            },
        },
    },
}

return quest
