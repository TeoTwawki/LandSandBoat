-----------------------------------
-- Mog House related functions
-----------------------------------
require('scripts/globals/npc_util')
require('scripts/globals/quests')
-----------------------------------
xi = xi or {}
invaderXim.moghouse = invaderXim.moghouse or {}

-----------------------------------
-- Mog Locker constants
-----------------------------------
local mogLockerStartTimestamp   = 1009810800 -- unix timestamp for 2001/12/31 15:00
local mogLockerTimestampVarName = 'mog-locker-expiry-timestamp'

invaderXim.moghouse.MOGLOCKER_ALZAHBI_VALID_DAYS    = 7
invaderXim.moghouse.MOGLOCKER_ALLAREAS_VALID_DAYS   = 5
invaderXim.moghouse.MOGLOCKER_PLAYERVAR_ACCESS_TYPE = 'mog-locker-access-type'

invaderXim.moghouse.lockerAccessType =
{
    ALZAHBI  = 0,
    ALLAREAS = 1,
}

invaderXim.moghouse.moghouseZones =
{
    invaderXim.zone.AL_ZAHBI,             -- 49
    invaderXim.zone.AHT_URHGAN_WHITEGATE, -- 50
    invaderXim.zone.SOUTHERN_SAN_DORIA_S, -- 80
    invaderXim.zone.BASTOK_MARKETS_S,     -- 87
    invaderXim.zone.WINDURST_WATERS_S,    -- 94
    invaderXim.zone.RESIDENTIAL_AREA,     -- 219
    invaderXim.zone.SOUTHERN_SAN_DORIA,   -- 230
    invaderXim.zone.NORTHERN_SAN_DORIA,   -- 231
    invaderXim.zone.PORT_SAN_DORIA,       -- 232
    invaderXim.zone.BASTOK_MINES,         -- 234
    invaderXim.zone.BASTOK_MARKETS,       -- 235
    invaderXim.zone.PORT_BASTOK,          -- 236
    invaderXim.zone.WINDURST_WATERS,      -- 238
    invaderXim.zone.WINDURST_WALLS,       -- 239
    invaderXim.zone.PORT_WINDURST,        -- 240
    invaderXim.zone.WINDURST_WOODS,       -- 241
    invaderXim.zone.RULUDE_GARDENS,       -- 243
    invaderXim.zone.UPPER_JEUNO,          -- 244
    invaderXim.zone.LOWER_JEUNO,          -- 245
    invaderXim.zone.PORT_JEUNO,           -- 246
    invaderXim.zone.WESTERN_ADOULIN,      -- 256
    invaderXim.zone.EASTERN_ADOULIN,      -- 257
}

invaderXim.moghouse.moghouse2FUnlockCSs =
{
    [invaderXim.zone.SOUTHERN_SAN_DORIA] = 3535,
    [invaderXim.zone.NORTHERN_SAN_DORIA] = 904,
    [invaderXim.zone.PORT_SAN_DORIA]     = 820,
    [invaderXim.zone.BASTOK_MINES]       = 610,
    [invaderXim.zone.BASTOK_MARKETS]     = 604,
    [invaderXim.zone.PORT_BASTOK]        = 456,
    [invaderXim.zone.WINDURST_WATERS]    = 1086,
    [invaderXim.zone.WINDURST_WALLS]     = 547,
    [invaderXim.zone.PORT_WINDURST]      = 903,
    [invaderXim.zone.WINDURST_WOODS]     = 885,
}

invaderXim.moghouse.isInMogHouseInHomeNation = function(player)
    if not player:isInMogHouse() then
        return false
    end

    local currentZone = player:getZoneID()
    local nation      = player:getNation()

    -- TODO: Simplify nested conditions
    if nation == invaderXim.nation.BASTOK then
        if
            currentZone >= invaderXim.zone.BASTOK_MINES and
            currentZone <= invaderXim.zone.PORT_BASTOK
        then
            return true
        end
    elseif nation == invaderXim.nation.SANDORIA then
        if
            currentZone >= invaderXim.zone.SOUTHERN_SAN_DORIA and
            currentZone <= invaderXim.zone.PORT_SAN_DORIA
        then
            return true
        end
    else
        if
            currentZone >= invaderXim.zone.WINDURST_WATERS and
            currentZone <= invaderXim.zone.WINDURST_WOODS
        then
            return true
        end
    end

    return false
end

invaderXim.moghouse.set2ndFloorStyle = function(player, style)
    -- 0x0080: This bit and the next track which 2F decoration style is being used (0: SANDORIA, 1: BASTOK, 2: WINDURST, 3: PATIO)
    -- 0x0100: ^ As above
    local mhflag = player:getMoghouseFlag()
    utils.mask.setBit(mhflag, 0x0080, utils.mask.getBit(style, 0))
    utils.mask.setBit(mhflag, 0x0100, utils.mask.getBit(style, 1))
    player:setMoghouseFlag(mhflag)
end

invaderXim.moghouse.getAvailableMusic = function(player)
    -- See documentation/songdata.txt or documentation/MusicIDs.txt for song data.
    local possibleSongs = {}

    local orchestrion  = player:findItem(invaderXim.item.ORCHESTRION)
    local spinet       = player:findItem(invaderXim.item.SPINET)
    local nanaaStatue1 = player:findItem(invaderXim.item.NANAA_MIHGO_STATUE)
    local nanaaStatue2 = player:findItem(invaderXim.item.NANAA_MIHGO_STATUE_II)

    local hasOrchestrion  = orchestrion and orchestrion:isInstalled()
    local hasSpinet       = spinet and spinet:isInstalled()
    local hasNanaaStatue1 = nanaaStatue1 and nanaaStatue1:isInstalled()
    local hasNanaaStatue2 = nanaaStatue2 and nanaaStatue2:isInstalled()

    -- NOTE: Since Spinet, Nanaa Mihgo Statue I, and Nanaa Mihgo Statue II are promotional-only items,
    --     : it is extremely difficult to get them and test what they do when used together.
    --     : We're completely guessing how they interact with each other.
    --     : TODO: Do these overwrite eachother in some way, or do they work together (as we've implemented
    --     : them here)?
    if not hasOrchestrion then
        -- https://www.bg-wiki.com/ffxi/Orchestrion
        if hasSpinet then
            table.insert(possibleSongs, 112) -- Selbina
            table.insert(possibleSongs, 196) -- Fighters of the Crystal
            table.insert(possibleSongs, 230) -- A New Horizon
            table.insert(possibleSongs, 187) -- Ragnarok
            table.insert(possibleSongs, 215) -- Clash of Standards
            table.insert(possibleSongs, 47)  -- Echoes of Creation
            table.insert(possibleSongs, 49)  -- Luck of the Mog
            table.insert(possibleSongs, 50)  -- Feast of the Ladies
            table.insert(possibleSongs, 51)  -- Abyssea
            table.insert(possibleSongs, 52)  -- Melodies Errant
            table.insert(possibleSongs, 109) -- Ronfaure
            table.insert(possibleSongs, 251) -- Autumn Footfalls
            table.insert(possibleSongs, 48)  -- Main Theme
            table.insert(possibleSongs, 126) -- Mog House
        end

        if hasNanaaStatue1 then
            table.insert(possibleSongs, 69) -- Distant Worlds (Nanaa Mihgo's Version)
        end

        if hasNanaaStatue2 then
            table.insert(possibleSongs, 59) -- The Pioneers (Nanaa Mihgo's Version)
        end
    end

    return possibleSongs
end

invaderXim.moghouse.trySetMusic = function(player)
    local possibleSongs = invaderXim.moghouse.getAvailableMusic(player)

    if #possibleSongs > 0 then
        -- This needs a moment before music changes can take effect
        player:timer(1000, function(playerArg)
            playerArg:changeMusic(6, utils.randomEntry(possibleSongs))
        end)
    end
end

invaderXim.moghouse.onMoghouseZoneIn = function(player, prevZone)
    local cs = -1

    player:eraseAllStatusEffect()
    player:delStatusEffectSilent(invaderXim.effect.POISON)
    player:delStatusEffectSilent(invaderXim.effect.BLINDNESS)
    player:delStatusEffectSilent(invaderXim.effect.PARALYSIS)
    player:delStatusEffectSilent(invaderXim.effect.SILENCE)

    player:setPos(0, 0, 0, 192)

    -- Moghouse data (bit-packed)
    -- 0x0001: SANDORIA exit quest flag
    -- 0x0002: BASTOK exit quest flag
    -- 0x0004: WINDURST exit quest flag
    -- 0x0008: JEUNO exit quest flag
    -- 0x0010: WEST_AHT_URHGAN exit quest flag
    -- 0x0020: Unlocked Moghouse2F flag
    -- 0x0040: Moghouse 2F tracker flag (0: default, 1: using 2F)
    -- 0x0080: This bit and the next track which 2F decoration style is being used (0: SANDORIA, 1: BASTOK, 2: WINDURST, 3: PATIO)
    -- 0x0100: ^ As above
    local mhflag = player:getMoghouseFlag()

    local growingFlowers   = bit.band(mhflag, 0x0001) > 0
    local aLadysHeart      = bit.band(mhflag, 0x0002) > 0
    local flowerChild      = bit.band(mhflag, 0x0004) > 0
    local unlocked2ndFloor = bit.band(mhflag, 0x0020) > 0
    local using2ndFloor    = bit.band(mhflag, 0x0040) > 0

    -- NOTE: You can test these quest conditions with:
    -- Reset: !exec player:setMoghouseFlag(0)
    -- Complete quests: !exec player:setMoghouseFlag(7)
    if
        invaderXim.moghouse.isInMogHouseInHomeNation(player) and
        growingFlowers and
        aLadysHeart and
        flowerChild and
        not unlocked2ndFloor and
        not using2ndFloor
    then
        cs = invaderXim.moghouse.moghouse2FUnlockCSs[player:getZoneID()]

        player:setMoghouseFlag(mhflag + 0x0020) -- Set unlock flag now, rather than in onEventFinish

        local nation = player:getNation()
        invaderXim.moghouse.set2ndFloorStyle(player, nation)
    end

    invaderXim.moghouse.trySetMusic(player)

    return cs
end

invaderXim.moghouse.moogleTrade = function(player, npc, trade)
    if player:isInMogHouse() then
        local numBronze = trade:getItemQty(invaderXim.item.IMPERIAL_BRONZE_PIECE)

        if numBronze > 0 then
            if invaderXim.moghouse.addMogLockerExpiryTime(player, numBronze) then
                player:tradeComplete()
                player:messageSpecial(zones[player:getZoneID()].text.MOG_LOCKER_OFFSET + 2, invaderXim.moghouse.getMogLockerExpiryTimestamp(player))
            end
        end

        local eggComponents =
        {
            invaderXim.item.EGG_LOCKER,
            invaderXim.item.EGG_TABLE,
            invaderXim.item.EGG_STOOL,
            invaderXim.item.EGG_LANTERN,
        }

        if npcUtil.tradeHasExactly(trade, eggComponents) then
            if npcUtil.giveItem(player, invaderXim.item.EGG_BUFFET) then
                player:confirmTrade()
            end

        elseif npcUtil.tradeHasExactly(trade, invaderXim.item.EGG_BUFFET) then
            if npcUtil.giveItem(player, eggComponents) then
                player:confirmTrade()
            end
        end
    end
end

invaderXim.moghouse.moogleTrigger = function(player, npc)
    if player:isInMogHouse() then
        local lockerTs = invaderXim.moghouse.getMogLockerExpiryTimestamp(player)

        if lockerTs ~= nil then
            if lockerTs == -1 then -- Expired
                player:messageSpecial(zones[player:getZoneID()].text.MOG_LOCKER_OFFSET + 1, invaderXim.item.IMPERIAL_BRONZE_PIECE)
            else
                player:messageSpecial(zones[player:getZoneID()].text.MOG_LOCKER_OFFSET, lockerTs)
            end
        end

        player:sendMenu(invaderXim.menuType.MOOGLE)
    end
end

invaderXim.moghouse.moogleEventUpdate = function(player, csid, option, npc)
end

invaderXim.moghouse.moogleEventFinish = function(player, csid, option, npc)
end

-- Unlocks a mog locker for a player. Returns the 'expired' timestamp (-1)
invaderXim.moghouse.unlockMogLocker = function(player)
    player:setCharVar(mogLockerTimestampVarName, -1)

    -- Safety check in case some servers auto-set 80 slots for mog locker items.
    if player:getContainerSize(invaderXim.inv.MOGLOCKER) == 0 then
        player:changeContainerSize(invaderXim.inv.MOGLOCKER, 30)
    end

    return -1
end

-- Sets the mog locker access type (all area or alzahbi only). Returns the new access type.
invaderXim.moghouse.setMogLockerAccessType = function(player, accessType)
    player:setCharVar(invaderXim.moghouse.MOGLOCKER_PLAYERVAR_ACCESS_TYPE, accessType)

    return accessType
end

-- Gets the mog locker access type (all area or alzahbi only). Returns the new access type.
invaderXim.moghouse.getMogLockerAccessType = function(player)
    return player:getCharVar(invaderXim.moghouse.MOGLOCKER_PLAYERVAR_ACCESS_TYPE)
end

-- Gets the expiry time for your locker. A return value of -1 is expired. A return value of nil means mog locker hasn't been unlocked.
invaderXim.moghouse.getMogLockerExpiryTimestamp = function(player)
    local expiryTime = player:getCharVar(mogLockerTimestampVarName)

    if expiryTime == 0 then
        return nil
    end

    local now = os.time() - mogLockerStartTimestamp

    if now > expiryTime then
        player:setCharVar(mogLockerTimestampVarName, -1)

        return -1
    end

    return expiryTime
end

-- Adds time to your mog locker, given the number of bronze coins.
-- The amount of time per bronze is affected by the access type
-- The expiry time itself is the number of seconds past 2001/12/31 15:00
-- Returns true if time was added successfully, false otherwise.
invaderXim.moghouse.addMogLockerExpiryTime = function(player, numBronze)
    local accessType       = invaderXim.moghouse.getMogLockerAccessType(player)
    local numDaysPerBronze = 5

    if accessType == invaderXim.moghouse.lockerAccessType.ALZAHBI then
        numDaysPerBronze = 7
    end

    local currentTs = invaderXim.moghouse.getMogLockerExpiryTimestamp(player)

    if currentTs == nil then
        return false
    end

    if currentTs == -1 then
        currentTs = os.time() - mogLockerStartTimestamp
    end

    local timeIncrease = 60 * 60 * 24 * numDaysPerBronze * numBronze
    local newTs        = currentTs + timeIncrease

    player:setCharVar(mogLockerTimestampVarName, newTs)

    -- Send an invent size packet to enable the items if they weren't.
    player:changeContainerSize(invaderXim.inv.MOGLOCKER, 0)

    return true
end
