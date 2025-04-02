-----------------------------------
-- Mog Bonanza
-- http://www.playonline.com/ff11us/guide/nomadmogbon/index.html
-- https://www.bg-wiki.com/ffxi/Category:Mog_Bonanza
-----------------------------------
xi = xi or {}
invaderXim.events = invaderXim.events or {}
invaderXim.events.mogBonanza = invaderXim.events.mogBonanza or {}
invaderXim.events.mogBonanza.data = invaderXim.events.mogBonanza.data or {}
invaderXim.events.mogBonanza.entities = invaderXim.events.mogBonanza.entities or {}

local localSettings =
{
    PEARL_COST            = 200000, -- NOTE: This number is hardcoded in the event
    MAX_PEARLS            = 1,
    DISABLE_PRIMEVAL_BREW = 1,      -- 0 will turn on the prank the moogle shows when purchasing

    -- 0x55: New Year's Nomad Mog Bonanza 2021
    -- 0x5A: 20th Vana'versary Nomad Mog Bonanza
    -- 0x5C: 21st Vana'versary Nomad Mog Bonanza
    -- 0x5E: <number>
    BONANZA_ID = 0x5C,

    -- These are local times, and should be tweaked based on your time zone
    BUYING_PERIOD_START     = os.time({ year = 2023, month = 5, day = 17, hour = 1, min =  0 }),
    BUYING_PERIOD_END       = os.time({ year = 2023, month = 6, day = 15, hour = 7, min = 59 }),
    COLLECTION_PERIOD_START = os.time({ year = 2023, month = 7, day = 11, hour = 1, min =  0 }),
    COLLECTION_PERIOD_END   = os.time({ year = 2023, month = 7, day = 31, hour = 7, min = 59 }),

    COLLECTION_SERVER_MESSAGE =
        'Announcing the winning numbers for the 21st Vana\'versary Nomad Mog Bonanza!\n' ..
        '\n' ..
        'Rank 3 prize: \'7\' (last digit)-- 13,298 winners.\n' ..
        'Rank 2 prize: \'71\' (last two digits)-- 1,299 winners.\n' ..
        'Rank 1 prize: \'800\' (all three digits)-- 62 winners.\n' ..
        '*The number of winners for each prize is a combined total from all worlds.\n' ..
        '\n' ..
        'Collection period: On July 11, 2023 at 1:00 (PDT) / 8:00 (GMT) to July 31, at 7:59 (PDT) / 14:59 (GMT)\n' ..
        'Details on the prize can be confirmed by speaking to a Bonanza Moogle at one of the following locations:\n' ..
        'Port San d\'Oria (I-9) / Port Bastok (L-8) / Port Windurst (F-6) / Chocobo Circuit (H-8)\n',

    -- Winning Numbers are three independent values for each rank prize:
    WINNING_NUMBERS =
    {
        [1] = 800,
        [2] = 71,
        [3] = 7,
    },
}

local event = SeasonalEvent:new('MogBonanza')

invaderXim.events.mogBonanza.enabledCheck = function()
    local currentTime = os.time()

    return currentTime >= localSettings.BUYING_PERIOD_START and
        currentTime <= localSettings.COLLECTION_PERIOD_END
end

local isInPurchasingPeriod = function()
    local currentTime = os.time()

    return invaderXim.events.mogBonanza.enabledCheck() and
        currentTime >= localSettings.BUYING_PERIOD_START and
        currentTime <= localSettings.BUYING_PERIOD_END
end

local isInCollectionPeriod = function()
    local currentTime = os.time()

    return invaderXim.events.mogBonanza.enabledCheck() and
        currentTime >= localSettings.COLLECTION_PERIOD_START and
        currentTime <= localSettings.COLLECTION_PERIOD_END
end

event:setEnableCheck(invaderXim.events.mogBonanza.enabledCheck)

local csidLookup =
{
    [invaderXim.zone.PORT_SAN_DORIA ] = 824,
    [invaderXim.zone.PORT_BASTOK    ] = 467,
    [invaderXim.zone.PORT_WINDURST  ] = 912,
    [invaderXim.zone.CHOCOBO_CIRCUIT] = 503,
}

-- NOTE: Each Reward Rank can support up to 46 items along with a gil reward.  This is bit-packed
-- where param0 in the event update is the gil reward, and each following parameter contains two items
-- (upper and lower 16 bits).  There are 3 event update requests per rank.  Any 0-value parameter
-- will stop the event from processing further values.
local rewardList =
{
    -- Rank 1 Prizes
    [1] =
    {
        gilReward = 0,

        rewardItems =
        {
            [ 0] = invaderXim.item.ICE_BRAND,
            [ 1] = invaderXim.item.ONION_SWORD_III,
            [ 2] = invaderXim.item.AIR_KNIFE,
            [ 3] = invaderXim.item.ZANMATO_P2,
            [ 4] = invaderXim.item.DRAGON_FANGS,
            [ 5] = invaderXim.item.MALEFIC_AXE,
            [ 6] = invaderXim.item.DRASTIC_AXE,
            [ 7] = invaderXim.item.ARTEMISS_BOW_P2,
            [ 8] = invaderXim.item.MIRACLE_CHEER,
            [ 9] = invaderXim.item.FINAL_SICKLE,
            [10] = invaderXim.item.PANDITS_STAFF,
            [11] = invaderXim.item.CHOCOBO_KNIFE,
            [12] = invaderXim.item.DIAMOND_ASPIS,
            [13] = invaderXim.item.FLAMETONGUE,
            [14] = invaderXim.item.MUTSU_NO_KAMI_YOSHIYUKI,
            [15] = invaderXim.item.HEBOS_SPEAR,
            [16] = invaderXim.item.PREMIUM_HEART,
            [17] = invaderXim.item.SAVE_THE_QUEEN_III,
            [18] = invaderXim.item.YAGYU_DARKBLADE,
            [19] = invaderXim.item.BRAVE_BLADE_III,
            [20] = invaderXim.item.WIZARDS_ROD,
            [21] = invaderXim.item.EXETER,
            [22] = invaderXim.item.COPY_OF_JUDGMENT_DAY,
            [23] = invaderXim.item.EBISU_FISHING_ROD,
            [24] = invaderXim.item.MOG_KUPON_AW_KUPO,
            [25] = invaderXim.item.ABDHALJS_TOME,
        },
    },

    -- Rank 2 Prizes
    [2] =
    {
        gilReward = 0,

        rewardItems =
        {
            [ 0] = invaderXim.item.MOG_KUPON_A_OMII,
            [ 1] = invaderXim.item.MOG_KUPON_AW_UWIII,
            [ 2] = invaderXim.item.MOG_KUPON_I_AF119,
            [ 3] = invaderXim.item.MOG_KUPON_AW_VGR,
            [ 4] = invaderXim.item.MOG_KUPON_I_RME,
            [ 5] = invaderXim.item.MOG_KUPON_W_PULSE,
            [ 6] = invaderXim.item.MOG_KUPON_AW_VGRII,
            [ 7] = invaderXim.item.MOG_KUPON_W_JOB,
            [ 8] = invaderXim.item.MOG_KUPON_A_DEII,
            [ 9] = invaderXim.item.MOG_KUPON_W_DEIII,
            [10] = invaderXim.item.WAILING_BELT,
            [11] = invaderXim.item.SHAPERS_SHAWL,
            [12] = invaderXim.item.TEN_THOUSAND_BYNE_BILL,
            [13] = invaderXim.item.RANPERRE_GOLDPIECE,
            [14] = invaderXim.item.RIMILALA_STRIPESHELL,
            [15] = invaderXim.item.BAYLD_CRYSTAL,
            [16] = invaderXim.item.DENSE_CLUSTER,
            [17] = invaderXim.item.CATS_EYE,
            [18] = invaderXim.item.MOG_KUPON_AW_GFIII,
            [19] = invaderXim.item.LU_SHANGS_FISHING_ROD,
        },
    },

    -- Rank 3 Prizes
    [3] =
    {
        gilReward = 0,

        rewardItems =
        {
            [ 0] = invaderXim.item.MOG_KUPON_AW_UW,
            [ 1] = invaderXim.item.MOG_KUPON_AW_COS,
            [ 2] = invaderXim.item.AUCUBA_CROWN,
            [ 3] = invaderXim.item.CURMUDGEONS_HELMET,
            [ 4] = invaderXim.item.GAZERS_HELMET,
            [ 5] = invaderXim.item.RETCHING_HELMET,
            [ 6] = invaderXim.item.KARAKUL_CAP,
            [ 7] = invaderXim.item.HOTENGEKI,
            [ 8] = invaderXim.item.GRUDGE,
            [ 9] = invaderXim.item.PLUTON_COFFER,
            [10] = invaderXim.item.BEITETSU_COFFER,
            [11] = invaderXim.item.RIFT_BOULDER_COFFER,
            [12] = invaderXim.item.MARBLE_MOG_PELL,
            [13] = invaderXim.item.OCHRE_MOG_PELL,
            [14] = invaderXim.item.MARS_ORB,
            [15] = invaderXim.item.CHOCOBO_ROPE,
            [16] = invaderXim.item.CHOCOBO_TORQUE,
            [17] = invaderXim.item.MOG_KUPON_A_SAP,
            [18] = invaderXim.item.MOG_KUPON_A_JAD,
            [19] = invaderXim.item.MOG_KUPON_A_RUB,
            [20] = invaderXim.item.DEMONIC_AXE,
            [21] = invaderXim.item.BRAVE_BLADE_II,
            [22] = invaderXim.item.ONION_SWORD_II,
            [23] = invaderXim.item.MOG_KUPON_I_ORCHE,
            [24] = invaderXim.item.SHEET_OF_PROMATHIAN_TUNES,
            [25] = invaderXim.item.SHEET_OF_ADOULINIAN_TUNES,
        },
    },
}

-- NOTE: The observed offset indices are 0, 1, and 4 for event updates.  All events seem to be heavily
-- reliant on base 2; however, there is no use of bit1 (2 value).  The below function implements the above
-- logic, but there may be something else that was deprecated in the past.
local function getRewardEventUpdate(option)
    local prizeRank    = bit.rshift(option, 8) + 1
    local updateOffset = math.min(bit.band(option, 0xF), 2)
    local maxItems     = updateOffset == 0 and 13 or 15
    local startIndex   = updateOffset * 14
    local updateTable  = { 0, 0, 0, 0, 0, 0, 0, 0 }

    if updateOffset == 0 then
        updateTable[1] = rewardList[prizeRank].gilReward
    end

    local updateParameter = 0
    for indexVal = startIndex, startIndex + maxItems do
        local updateIndex = math.floor((indexVal - startIndex) / 2) + 1
        if updateOffset == 0 then
            updateIndex = updateIndex + 1
        end

        if not rewardList[prizeRank].rewardItems[indexVal] then
            if updateParameter > 0 then
                updateTable[updateIndex] = updateParameter
            end

            break
        end

        if updateParameter > 0 then
            updateParameter = updateParameter + bit.lshift(rewardList[prizeRank].rewardItems[indexVal], 16)
            updateTable[updateIndex] = updateParameter
            updateParameter = 0
        else
            updateParameter = rewardList[prizeRank].rewardItems[indexVal]
        end
    end

    return updateTable
end

local prizeRankOptions =
{
    [1] = { 0, 1 },
    [2] = { 1, 0 },
    [3] = { 2, 0 },
    [4] = { 3, 0 },
}

-- Will return the rank of prize when compared to the winning number table.
local getPrizeRank = function(player, fullNumber)
    for prizeRank, winningNumber in pairs(localSettings.WINNING_NUMBERS) do
        local matchingNumber = tonumber(string.sub(fullNumber, -1 * string.len(winningNumber)))

        if matchingNumber == winningNumber then
            return prizeRank
        end
    end

    return 4
end

local giveBonanzaPearl = function(player, number)
    -- Absolute Max: 16777215
    -- Current events only allow for a 3-digit number, so this is restricted here.
    number = tonumber(number)
    if
        number == nil or
        number > 999 or
        number < 0
    then
        print(string.format('giveBonanzaPearl: %s tried to create a pear with invalid number: %d', player:getName(), number))
        return nil
    end

    player:addItem({ id = invaderXim.item.BONANZA_PEARL,
        exdata =
        {
            [0] = bit.band(number, 0xFF),
            [1] = bit.band(bit.rshift(number,  8), 0xFF),
            [2] = bit.band(bit.rshift(number, 16), 0xFF),
            [3] = bit.band(localSettings.BONANZA_ID, 0xFF),
            [4] = 0, -- 0xCE, -- These might not be needed
            [5] = 0, -- 0x62, -- These might not be needed
            [6] = 0, -- 0x95, -- These might not be needed
            [7] = 0, -- 0x23, -- These might not be needed
        }
    })
end

invaderXim.events.mogBonanza.onBonanzaMoogleTrade = function(player, npc, trade)
    if
        invaderXim.events.mogBonanza.enabledCheck() and
        isInCollectionPeriod() and
        npcUtil.tradeHasExactly(trade, invaderXim.item.BONANZA_PEARL)
    then
        local bonanzaPearl = trade:getItem(0)
        local exData       = bonanzaPearl:getExData()
        local eventId      = exData[3]

        if eventId == localSettings.BONANZA_ID then
            local baseCs      = csidLookup[player:getZoneID()]
            local pearlNumber = 0

            for exIndex = 0, 2 do
                pearlNumber = pearlNumber + bit.lshift(exData[exIndex], 8 * exIndex)
            end

            player:setLocalVar('prizeRank', getPrizeRank(player, pearlNumber))
            player:startEvent(baseCs + 2, 0, 0, 0, 0, 0, 0, 0, localSettings.BONANZA_ID)
        end
    end
end

invaderXim.events.mogBonanza.onBonanzaMoogleTrigger = function(player, npc)
    if invaderXim.events.mogBonanza.enabledCheck() then
        local baseCs = csidLookup[player:getZoneID()]

        if isInPurchasingPeriod() then
            player:startEvent(baseCs,
                localSettings.MAX_PEARLS,
                localSettings.DISABLE_PRIMEVAL_BREW,
                0,
                0,
                0,
                0,
                0,
                localSettings.BONANZA_ID
            )
        elseif isInCollectionPeriod() then
            player:startEvent(baseCs + 1,
                localSettings.WINNING_NUMBERS[1],
                localSettings.WINNING_NUMBERS[2],
                localSettings.WINNING_NUMBERS[3],
                0,
                0,
                0,
                0,
                localSettings.BONANZA_ID
            )
        end
    end
end

invaderXim.events.mogBonanza.onBonanzaMoogleEventUpdate = function(player, csid, option, npc)
    if invaderXim.events.mogBonanza.enabledCheck() then
        local baseCs = csidLookup[player:getZoneID()]

        if
            csid == baseCs + 2 and
            option == 8
        then
            local prizeRank = player:getLocalVar('prizeRank')

            if prizeRankOptions[prizeRank] then
                player:updateEvent(unpack(prizeRankOptions[prizeRank]))
            else
                print('ERROR: Bonanza event update received without valid prizeRank.')
                return
            end

        -- Purchase
        elseif
            csid == baseCs and
            bit.band(option, 0xFF) == 2
        then
            local selectedNumber = bit.rshift(option, 8)

            if
                player:getGil() < localSettings.PEARL_COST or
                player:getFreeSlotsCount() == 0
            then
                -- TODO: This is a generic I cannot serve you at this time.  There may be a specific message
                -- for lack of gil.

                player:updateEvent(0, 0, 0, 0, 0, 0, 0, 1)
            elseif player:getItemCount(invaderXim.item.BONANZA_PEARL) >= localSettings.MAX_PEARLS then
                player:updateEvent(0, localSettings.MAX_PEARLS, 0, 0, 0, 0, 0, 3)
            else
                player:setLocalVar('selectedNumber', selectedNumber)
                player:updateEvent(0, 0, 0, 0, 0, 0, 0, 0)
            end
        else
            player:updateEvent(unpack(getRewardEventUpdate(option)))
        end
    end
end

invaderXim.events.mogBonanza.onBonanzaMoogleEventFinish = function(player, csid, option, npc)
    if invaderXim.events.mogBonanza.enabledCheck() then
        local zoneId = player:getZoneID()
        local baseCs = csidLookup[player:getZoneID()]

        if csid == baseCs then
            if option == 3 then
                local selectedNumber = player:getLocalVar('selectedNumber')
                local ID             = zones[zoneId]

                player:delGil(localSettings.PEARL_COST)
                giveBonanzaPearl(player, selectedNumber)
                player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.BONANZA_PEARL)
            end
        elseif csid == baseCs + 2 then
            local optionType = bit.band(option, 0xFF)

            if optionType == 4 then
                local prizeRank    = player:getLocalVar('prizeRank')
                local selectedItem = bit.rshift(option, 16) - 1

                if
                    rewardList[prizeRank] and
                    rewardList[prizeRank].rewardItems[selectedItem] and
                    npcUtil.giveItem(player, rewardList[prizeRank].rewardItems[selectedItem])
                then
                    player:confirmTrade()
                elseif selectedItem == -1 then
                    npcUtil.giveCurrency(player, 'gil', rewardList[prizeRank].gilReward)
                    player:confirmTrade()
                end
            elseif
                optionType == 6 and
                npcUtil.giveItem(player, invaderXim.item.BONANZA_BISCUIT)
            then
                player:confirmTrade()
            end
        end
    end
end

event:setStartFunction(function()
    -- TODO: Show/Hide Bonanza Moogles
    -- TODO: Append onto invaderXim.settings.main.SERVER_MESSAGE
end)

event:setEndFunction(function()
    -- TODO: Show/Hide Bonanza Moogles
end)

return event
