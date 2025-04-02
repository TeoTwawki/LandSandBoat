-----------------------------------
-- Shattering Stars
-----------------------------------
-- Log ID: 3, Quest ID: 132
-- Maat : !pos 8 3 118 243
-----------------------------------
local ruludeID = zones[invaderXim.zone.RULUDE_GARDENS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS)

quest.reward =
{
    fame = 80,
    fameArea = invaderXim.fameArea.JEUNO,
    title = invaderXim.title.STAR_BREAKER,
}

local maatBattlefieldIds =
{
    [invaderXim.zone.BALGAS_DAIS]        = { 101, 102, 103 },
    [invaderXim.zone.CHAMBER_OF_ORACLES] = { 194, 195, 196 },
    [invaderXim.zone.HORLAIS_PEAK]       = {   5,   6,   7 },
    [invaderXim.zone.QUBIA_ARENA]        = { 517, 518, 519 },
    [invaderXim.zone.WAUGHROON_SHRINE]   = {  70,  71,  72 },
}

local maatBattlefieldZone =
{
    onEventFinish =
    {
        [32001] = function(player, csid, option, npc)
            local battlefieldWin = player:getLocalVar('battlefieldWin')

            for _, battlefieldId in ipairs(maatBattlefieldIds[player:getZoneID()]) do
                if battlefieldWin == battlefieldId then
                    local jobId        = player:getMainJob()
                    local maatsCapMask = player:getCharVar('maatsCap')

                    if player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS) == invaderXim.questStatus.QUEST_ACCEPTED then
                        npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_INSTANT_WARP)
                        quest:setVar(player, 'Prog', jobId)
                    end

                    if not utils.mask.getBit(maatsCapMask, jobId - 1) then
                        player:setCharVar('maatsCap', utils.mask.setBit(maatsCapMask, jobId - 1, true))
                    end

                    player:addTitle(invaderXim.title.MAAT_MASHER)
                end
            end
        end,
    },
}

quest.sections =
{
    -- Section: Quest available.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainJob() <= 15 and -- Only the "old" jobs may start this quest.
                player:getMainLvl() >= 66 and
                player:getLevelCap() == 70 and
                invaderXim.settings.main.MAX_LEVEL >= 75
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(92, player:getMainJob())
                end,
            },

            onEventFinish =
            {
                [92] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    -- Section: Quest accepted.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                player:getMainJob() <= 15 and
                player:getMainLvl() >= 66
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') >= 1 then
                        return quest:progressEvent(93) -- Complete quest.
                    elseif quest:getVar(player, 'Prog') == 0 then
                        return quest:event(91, player:getMainJob())
                    end
                end,

                onTrade = function(player, npc, trade)
                    local properTestimony = invaderXim.item.WARRIORS_TESTIMONY + player:getMainJob() - 1

                    if
                        npcUtil.tradeHasExactly(trade, properTestimony) and
                        quest:getVar(player, 'Prog') == 0
                    then
                        return quest:progressEvent(64, player:getMainJob())
                    end
                end,
            },

            onEventFinish =
            {
                [64] = function(player, csid, option, npc)
                    if option == 1 then
                        local mJob = player:getMainJob()
                        if mJob == invaderXim.job.MNK or mJob == invaderXim.job.WHM or mJob == invaderXim.job.SMN then
                            player:setPos(299.316, -123.591, 353.760, 66, 146)
                        elseif mJob == invaderXim.job.WAR or mJob == invaderXim.job.BLM or mJob == invaderXim.job.RNG then
                            player:setPos(-511.459, 159.004, -210.543, 10, 139)
                        elseif mJob == invaderXim.job.PLD or mJob == invaderXim.job.DRK or mJob == invaderXim.job.BRD then
                            player:setPos(-225.146, -24.250, 20.057, 255, 206)
                        elseif mJob == invaderXim.job.RDM or mJob == invaderXim.job.THF or mJob == invaderXim.job.BST then
                            player:setPos(-349.899, 104.213, -260.150, 0, 144)
                        elseif mJob == invaderXim.job.SAM or mJob == invaderXim.job.NIN or mJob == invaderXim.job.DRG then
                            player:setPos(-220.084, -0.645, 4.442, 191, 168)
                        end
                    end
                end,

                [93] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:setLevelCap(75)
                        player:messageSpecial(ruludeID.text.YOUR_LEVEL_LIMIT_IS_NOW_75)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status >= invaderXim.questStatus.QUEST_ACCEPTED and
                player:getMainJob() <= 15 and
                player:getMainLvl() >= 66
        end,

        [invaderXim.zone.BALGAS_DAIS]        = maatBattlefieldZone,
        [invaderXim.zone.CHAMBER_OF_ORACLES] = maatBattlefieldZone,
        [invaderXim.zone.HORLAIS_PEAK]       = maatBattlefieldZone,
        [invaderXim.zone.QUBIA_ARENA]        = maatBattlefieldZone,
        [invaderXim.zone.WAUGHROON_SHRINE]   = maatBattlefieldZone,
    },
}

return quest
