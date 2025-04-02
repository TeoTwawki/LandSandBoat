-----------------------------------
-- As Thick as Thieves
-----------------------------------
-- !addquest 2 70
-- Nanaa Mihgo    : !pos 62 -4 240 241
-- qm2 (Tower)    : !pos 196.830 31.300 206.078 120
-- qm3 (Tower)    : !pos 417.121 15.598 -137.466 120
-- qm4 (Tower)    : !pos 129.587 -0.600 -235.525 120
-- qm5 (Tower)    : !pos -117.713 15.237 45.929 120
-- qm6 (Tower)    : !pos 363.481 23.600 6.335 120
-- qm7 (Tower)    : !pos -193.869 15.400 276.837 120
-- Sniggnix       : !pos -45.832 4.498 -135.029 245
-- qm3 (Saltvix)  : !pos -367.367 2.999 229.020 191
-- qm4 (Grasswix) : !pos -375.379 -2.221 445.034 191
-- qm5 (Eggblix)  : !pos -462.436 2.456 -141.171 191
-- qm2 (???)      : !pos -232.924 99.107 442.990 106
-----------------------------------
local dangrufID        = zones[invaderXim.zone.DANGRUF_WADI]
local northGustabergID = zones[invaderXim.zone.NORTH_GUSTABERG]
local sauromugueID     = zones[invaderXim.zone.SAUROMUGUE_CHAMPAIGN]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.AS_THICK_AS_THIEVES)

quest.reward =
{
    item = invaderXim.item.ROGUES_BONNET,
}

local function isNaked(player)
    for i = invaderXim.slot.MAIN, invaderXim.slot.BACK do
        if player:getEquipID(i) ~= 0 then
            return false
        end
    end

    return true
end

local towerIncorrectTrade = function(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, invaderXim.item.GRAPNEL) then
        return quest:messageSpecial(sauromugueID.text.THF_AF_WALL_OFFSET + 3, 0, invaderXim.item.GRAPNEL)
    end
end

local towerOnTrigger = function(player, npc)
    if not player:hasKeyItem(invaderXim.ki.FIRST_SIGNED_FORGED_ENVELOPE) then
        if
            quest:getLocalVar(npc, 'Option') == 1 and
            not player:findItem(invaderXim.item.GRAPNEL) and
            npcUtil.popFromQM(player, npc, sauromugueID.mob.CLIMBPIX_HIGHRISE, { radius = 1, hide = 0 })
        then
            return quest:messageSpecial(sauromugueID.text.THF_AF_MOB)
        else
            -- It is impossible to climb this wall with your bare hands.
            return quest:messageSpecial(sauromugueID.text.THF_AF_WALL_OFFSET)
        end
    else
        -- There is no longer any need to climb the tower.
        return quest:messageSpecial(sauromugueID.text.THF_AF_WALL_OFFSET + 1)
    end
end

local function handleDangrufMinigame(player, winEventId, loseEventId, itemPlaced)
    local rand1 = math.random(1, 999)
    local rand2 = math.random(1, 999)

    if rand1 > rand2 then
        player:messageSpecial(dangrufID.text.YOU_PLACE_ITEM, 0, itemPlaced)
        return quest:progressEvent(winEventId, invaderXim.item.REGAL_DIE, 0, rand1, rand2)
    else
        player:messageSpecial(dangrufID.text.YOU_PLACE_ITEM, 0, itemPlaced)
        return quest:progressEvent(loseEventId, 0, 0, rand1, rand2)
    end
end

local lostMinigameEvent = function(player, csid, option, npc)
    player:confirmTrade()

    -- Only Saltvix has an alternate CS progression on repeating attempts
    if csid == 139 or csid == 145 then
        quest:setVar(player, 'failedGame', 1)
    end

    if option == 1 then
        player:messageSpecial(dangrufID.text.GOBLIN_BEAT_YOU)
    elseif option == 2 then
        player:messageSpecial(dangrufID.text.YOU_GAVE_UP)
    end
end

local wonMinigameEvent = function(player, csid, option, npc)
    player:confirmTrade()

    if option == 0 then
        if csid == 136 or csid == 142 then
            quest:setVar(player, 'failedGame', 0)
        end

        player:messageSpecial(dangrufID.text.YOU_BEAT_GOBLIN)
        quest:setVar(player, 'Prog', quest:getVar(player, 'Prog') + 1)
    elseif option == 2 then
        if csid == 136 or csid == 142 then
            quest:setVar(player, 'failedGame', 1)
        end

        player:messageSpecial(dangrufID.text.YOU_GAVE_UP)
    end
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_TENSHODO_SHOWDOWN) and
                player:getMainJob() == invaderXim.job.THF and
                player:getMainLvl() >= invaderXim.settings.main.AF2_QUEST_LEVEL
        end,

        [invaderXim.zone.WINDURST_WOODS] =
        {
            ['Nanaa_Mihgo'] = quest:progressEvent(504, 0, invaderXim.ki.SIGNED_ENVELOPE, invaderXim.ki.TENSHODO_ENVELOPE),

            onEventFinish =
            {
                [504] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, { invaderXim.ki.GANG_WHEREABOUTS_NOTE, invaderXim.ki.FIRST_FORGED_ENVELOPE, invaderXim.ki.SECOND_FORGED_ENVELOPE })
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.DANGRUF_WADI] =
        {
            ['qm3'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.CHUNK_OF_ROCK_SALT) then
                        local questProgress = quest:getVar(player, 'Prog')
                        local eventOffset   = quest:getVar(player, 'failedGame') == 0 and 136 or 142

                        if questProgress == 1 then
                            return handleDangrufMinigame(player, eventOffset, eventOffset + 3, invaderXim.item.CHUNK_OF_ROCK_SALT)
                        elseif questProgress > 1 then
                            player:messageSpecial(dangrufID.text.BEAT_SALTVIX)
                        end
                    end
                end,
            },

            ['qm4'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.CLUMP_OF_GAUSEBIT_WILDGRASS) then
                        local questProgress = quest:getVar(player, 'Prog')

                        if questProgress == 2 then
                            return handleDangrufMinigame(player, 137, 140, invaderXim.item.CLUMP_OF_GAUSEBIT_WILDGRASS)
                        elseif questProgress < 2 then
                            return quest:messageSpecial(dangrufID.text.DONT_WASTE_TIME)
                        elseif questProgress > 2 then
                            return quest:messageSpecial(dangrufID.text.BEAT_GRASSWIX)
                        end
                    end
                end,
            },

            ['qm5'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, invaderXim.item.LIZARD_EGG) then
                        local questProgress = quest:getVar(player, 'Prog')

                        if questProgress == 3 then
                            return handleDangrufMinigame(player, 138, 141, invaderXim.item.LIZARD_EGG)
                        elseif questProgress < 3 then
                            return quest:messageSpecial(dangrufID.text.JUST_WONT_DO)
                        elseif questProgress > 3 then
                            return quest:messageSpecial(dangrufID.text.BEAT_EGGBLIX)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [136] = wonMinigameEvent,
                [137] = wonMinigameEvent,
                [138] = wonMinigameEvent,
                [139] = lostMinigameEvent,
                [140] = lostMinigameEvent,
                [141] = lostMinigameEvent,
                [142] = wonMinigameEvent,
                [145] = lostMinigameEvent,
            },
        },

        [invaderXim.zone.LOWER_JEUNO] =
        {
            ['Sniggnix'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, invaderXim.item.REGAL_DIE) and
                        quest:getVar(player, 'Prog') == 6
                    then
                        return quest:progressEvent(10026, 0, invaderXim.item.REGAL_DIE, math.random(1, 700))
                    end
                end,

                onTrigger = function(player, npc)
                    -- NOTE: 'Prog' questVar is only used for the gambling phase of this quest.  All other tracking utilizes
                    -- key items obtained.
                    local questProgress = quest:getVar(player, 'Prog')
                    local rand1 = math.random(1, 999)
                    local rand2 = math.random(1, 999)

                    if questProgress == 0 then
                        return quest:progressEvent(10024, 0, invaderXim.item.REGAL_DIE, rand1, rand2)
                    elseif
                        questProgress >= 1 and
                        questProgress <= 5
                    then
                        return quest:progressEvent(10025, 0, invaderXim.item.REGAL_DIE, rand1, rand2)
                    else
                        return quest:progressEvent(10023)
                    end
                end,
            },

            onEventFinish =
            {
                [10024] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                [10026] = function(player, csid, option, npc)
                    player:confirmTrade()
                    player:delKeyItem(invaderXim.ki.SECOND_FORGED_ENVELOPE)
                    npcUtil.giveKeyItem(player, invaderXim.ki.SECOND_SIGNED_FORGED_ENVELOPE)
                    quest:setVar(player, 'Prog', 7)
                end,
            },
        },

        [invaderXim.zone.NORTH_GUSTABERG] =
        {
            ['Gambilox_Wanderling'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if quest:getVar(player, 'Prog') == 4 then
                        quest:setVar(player, 'Prog', 5)
                    end
                end,
            },

            ['qm2'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 4 then
                        npcUtil.popFromQM(player, npc, northGustabergID.mob.GAMBILOX_WANDERLING, { hide = 0 })
                        return quest:messageSpecial(northGustabergID.text.SENSE_EVIL_PRESENCE)
                    elseif questProgress == 5 then
                        return quest:progressEvent(200, invaderXim.item.REGAL_DIE)
                    end
                end,
            },

            onEventFinish =
            {
                [200] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, invaderXim.item.REGAL_DIE) then
                        quest:setVar(player, 'Prog', 6)
                    end
                end,
            },
        },

        [invaderXim.zone.SAUROMUGUE_CHAMPAIGN] =
        {
            ['qm2'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        not player:hasKeyItem(invaderXim.ki.FIRST_SIGNED_FORGED_ENVELOPE) and
                        npcUtil.tradeHasExactly(trade, invaderXim.item.GRAPNEL)
                    then
                        if isNaked(player) then
                            return quest:progressEvent(2, 0, invaderXim.item.GRAPNEL)
                        else
                            player:messageSpecial(sauromugueID.text.THF_AF_WALL_OFFSET + 2, 0, invaderXim.item.GRAPNEL)
                        end
                    end
                end,

                onTrigger = towerOnTrigger,
            },

            ['qm3'] =
            {
                onTrade   = towerIncorrectTrade,
                onTrigger = towerOnTrigger,
            },

            ['qm4'] =
            {
                onTrade   = towerIncorrectTrade,
                onTrigger = towerOnTrigger,
            },

            ['qm5'] =
            {
                onTrade   = towerIncorrectTrade,
                onTrigger = towerOnTrigger,
            },

            ['qm6'] =
            {
                onTrade   = towerIncorrectTrade,
                onTrigger = towerOnTrigger,
            },

            ['qm7'] =
            {
                onTrade   = towerIncorrectTrade,
                onTrigger = towerOnTrigger,
            },

            onEventFinish =
            {
                [2] = function(player, csid, option, npc)
                    player:confirmTrade()
                    player:delKeyItem(invaderXim.ki.FIRST_FORGED_ENVELOPE)
                    npcUtil.giveKeyItem(player, invaderXim.ki.FIRST_SIGNED_FORGED_ENVELOPE)
                end,
            },
        },

        [invaderXim.zone.WINDURST_WOODS] =
        {
            ['Bopa_Greso']  = quest:progressEvent(506),
            ['Cha_Lebagta'] = quest:progressEvent(507, 0, invaderXim.item.GRAPNEL),

            ['Nanaa_Mihgo'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.FIRST_SIGNED_FORGED_ENVELOPE) and
                        player:hasKeyItem(invaderXim.ki.SECOND_SIGNED_FORGED_ENVELOPE)
                    then
                        return quest:progressEvent(508)
                    else
                        return quest:progressEvent(505, 0, invaderXim.ki.GANG_WHEREABOUTS_NOTE)
                    end
                end,
            },

            onEventFinish =
            {
                [508] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(invaderXim.ki.GANG_WHEREABOUTS_NOTE)
                        player:delKeyItem(invaderXim.ki.FIRST_SIGNED_FORGED_ENVELOPE)
                        player:delKeyItem(invaderXim.ki.SECOND_SIGNED_FORGED_ENVELOPE)
                        player:setLocalVar('Quest[2][71]mustZone', 1)
                    end
                end,
            },
        },
    },
}

return quest
