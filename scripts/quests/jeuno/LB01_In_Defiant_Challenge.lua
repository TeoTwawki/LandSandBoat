-----------------------------------
-- In Defiant Challenge
-----------------------------------
-- Log ID: 3, Quest ID: 128
-- Maat : !pos 8 3 118 243
-- Crawlers Nest
-- qm10 : !pos -83.391 -8.222 79.065 197
-- qm11 : !pos 98.081 -38.75 -181.198 197
-- qm12 : !pos 99.326 -0.126 -188.869 197
-- Garlaige Citadel
-- qm18 : !pos -13.425, -1.176, 191.669 200
-- qm19 : !pos -50.175 6.264 251.669 200
-- qm20 : !pos -137.047 0 347.502 200
-- The Eldieme Necropolis
-- qm7 : !pos 252.824 -32.000 -64.803 195
-- qm8 : !pos 105.275 -32 92.551 195
-- qm9 : !pos 92.272 -32 -64.676 195
-----------------------------------
local crawlersID = zones[invaderXim.zone.CRAWLERS_NEST]
local eldiemeID  = zones[invaderXim.zone.THE_ELDIEME_NECROPOLIS]
local garlaigeID = zones[invaderXim.zone.GARLAIGE_CITADEL]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.IN_DEFIANT_CHALLENGE)

local keyItemTable =
{
    [invaderXim.zone.CRAWLERS_NEST         ] = { invaderXim.item.CLUMP_OF_EXORAY_MOLD,     crawlersID.text.COMBINE_INTO_A_CLUMP,     crawlersID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.ki.EXORAY_MOLD_CRUMB1,     invaderXim.ki.EXORAY_MOLD_CRUMB2,     invaderXim.ki.EXORAY_MOLD_CRUMB3     },
    [invaderXim.zone.GARLAIGE_CITADEL      ] = { invaderXim.item.CHUNK_OF_BOMB_COAL,       garlaigeID.text.COMBINE_INTO_A_CHUNK,     garlaigeID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.ki.BOMB_COAL_FRAGMENT1,    invaderXim.ki.BOMB_COAL_FRAGMENT2,    invaderXim.ki.BOMB_COAL_FRAGMENT3    },
    [invaderXim.zone.THE_ELDIEME_NECROPOLIS] = { invaderXim.item.PIECE_OF_ANCIENT_PAPYRUS, eldiemeID.text.PUT_TOGUETHER_TO_COMPLETE, eldiemeID.text.ITEM_CANNOT_BE_OBTAINED,  invaderXim.ki.ANCIENT_PAPYRUS_SHRED1, invaderXim.ki.ANCIENT_PAPYRUS_SHRED2, invaderXim.ki.ANCIENT_PAPYRUS_SHRED3 },
}

-- Key Item removals. Needs to be called separately by the quest cleanup.
local function cleanKeyItemSet(player, zoneId)
    player:delKeyItem(keyItemTable[zoneId][4])
    player:delKeyItem(keyItemTable[zoneId][5])
    player:delKeyItem(keyItemTable[zoneId][6])
end

-- NOTE: This is handled in such an unconventional manner just so the text appears in the same order as in retail.
local function handleQMTrigger(player, zoneId, rewardKI)
    -- Era setting.
    if invaderXim.settings.main.OLDSCHOOL_G1 then
        return
    end

    local itemId = keyItemTable[zoneId][1]

    -- Give KI.
    if
        not player:hasItem(itemId) and  -- KI wont be given if we already possess the regular item.
        not player:hasKeyItem(rewardKI) -- KI wont be given if we already possess the key item.
    then
        npcUtil.giveKeyItem(player, rewardKI)
    end

    -- Handle KI set fusion.
    if
        player:hasKeyItem(keyItemTable[zoneId][4]) and
        player:hasKeyItem(keyItemTable[zoneId][5]) and
        player:hasKeyItem(keyItemTable[zoneId][6])
    then
        if
            not player:hasItem(itemId) and
            player:getFreeSlotsCount() > 0
        then
            cleanKeyItemSet(player, zoneId)
            player:messageSpecial(keyItemTable[zoneId][2], rewardKI)
            npcUtil.giveItem(player, itemId)
        else
            player:messageSpecial(keyItemTable[zoneId][3], itemId)
        end
    end
end

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.JEUNO,
    title    = invaderXim.title.HORIZON_BREAKER,
}

quest.sections =
{
    -- Section: Quest available.
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() == 50 and
                player:getLevelCap() == 50 and
                invaderXim.settings.main.MAX_LEVEL >= 55
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(79)
                end,
            },

            onEventFinish =
            {
                [79] = function(player, csid, option, npc)
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
                    return quest:event(80)
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { invaderXim.item.CLUMP_OF_EXORAY_MOLD, invaderXim.item.CHUNK_OF_BOMB_COAL, invaderXim.item.PIECE_OF_ANCIENT_PAPYRUS }) then
                        return quest:progressEvent(81)
                    end
                end,
            },

            onEventFinish =
            {
                [81] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        -- Remove all remaining/lingering KIs
                        cleanKeyItemSet(player, invaderXim.zone.CRAWLERS_NEST)
                        cleanKeyItemSet(player, invaderXim.zone.GARLAIGE_CITADEL)
                        cleanKeyItemSet(player, invaderXim.zone.THE_ELDIEME_NECROPOLIS)
                        -- Finish
                        player:confirmTrade()
                        player:setLevelCap(55)
                    end
                end,
            },
        },

        [invaderXim.zone.CRAWLERS_NEST] =
        {
            ['qm10'] =
            {
                onTrigger = function(player, npc)
                    handleQMTrigger(player, invaderXim.zone.CRAWLERS_NEST, invaderXim.ki.EXORAY_MOLD_CRUMB1)
                end,
            },

            ['qm11'] =
            {
                onTrigger = function(player, npc)
                    handleQMTrigger(player, invaderXim.zone.CRAWLERS_NEST, invaderXim.ki.EXORAY_MOLD_CRUMB2)
                end,
            },

            ['qm12'] =
            {
                onTrigger = function(player, npc)
                    handleQMTrigger(player, invaderXim.zone.CRAWLERS_NEST, invaderXim.ki.EXORAY_MOLD_CRUMB3)
                end,
            },
        },

        [invaderXim.zone.GARLAIGE_CITADEL] =
        {
            ['qm18'] =
            {
                onTrigger = function(player, npc)
                    handleQMTrigger(player, invaderXim.zone.GARLAIGE_CITADEL, invaderXim.ki.BOMB_COAL_FRAGMENT1)
                end,
            },

            ['qm19'] =
            {
                onTrigger = function(player, npc)
                    handleQMTrigger(player, invaderXim.zone.GARLAIGE_CITADEL, invaderXim.ki.BOMB_COAL_FRAGMENT2)
                end,
            },

            ['qm20'] =
            {
                onTrigger = function(player, npc)
                    handleQMTrigger(player, invaderXim.zone.GARLAIGE_CITADEL, invaderXim.ki.BOMB_COAL_FRAGMENT3)
                end,
            },
        },

        [invaderXim.zone.THE_ELDIEME_NECROPOLIS] =
        {
            ['qm7'] =
            {
                onTrigger = function(player, npc)
                    handleQMTrigger(player, invaderXim.zone.THE_ELDIEME_NECROPOLIS, invaderXim.ki.ANCIENT_PAPYRUS_SHRED1)
                end,
            },

            ['qm8'] =
            {
                onTrigger = function(player, npc)
                    handleQMTrigger(player, invaderXim.zone.THE_ELDIEME_NECROPOLIS, invaderXim.ki.ANCIENT_PAPYRUS_SHRED2)
                end,
            },

            ['qm9'] =
            {
                onTrigger = function(player, npc)
                    handleQMTrigger(player, invaderXim.zone.THE_ELDIEME_NECROPOLIS, invaderXim.ki.ANCIENT_PAPYRUS_SHRED3)
                end,
            },
        },
    },
}

return quest
