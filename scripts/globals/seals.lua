-----------------------------------
-- Seals and Crests trade (Shami/Shemo)
-----------------------------------
xi = xi or {}
invaderXim.seals = invaderXim.seals or {}

---@class sealItems
---@field [invaderXim.item] { [integer]: integer, [integer]: integer }
invaderXim.seals.sealItems =
{
    -- Trade Item ID              Seal ID, Retrieve Option
    [invaderXim.item.BEASTMENS_SEAL       ] = { 0, 2 },
    [invaderXim.item.KINDREDS_SEAL        ] = { 1, 1 },
    [invaderXim.item.KINDREDS_CREST       ] = { 2, 3 },
    [invaderXim.item.HIGH_KINDREDS_CREST  ] = { 3, 4 },
    [invaderXim.item.SACRED_KINDREDS_CREST] = { 4, 5 },
}

---@nodiscard
---@param trade CTradeContainer
---@return table
local function getSealTradeOption(trade)
    local sealsInTrade = {}
    for itemID, sealData in pairs(invaderXim.seals.sealItems) do
        if npcUtil.tradeHas(trade, itemID) then
            table.insert(sealsInTrade, { itemID, trade:getItemQty(itemID) })
        end
    end

    return sealsInTrade
end

-- Trading Seals/Crests
function invaderXim.seals.onTrade(player, npc, trade, eventParams)
    local sealOptions = getSealTradeOption(trade)

    if next(sealOptions) then
        local confirmedSeals = {}
        for _, sealOption in ipairs(sealOptions) do
            local itemId = sealOption[1]
            local storedSeals = player:getSeals(invaderXim.seals.sealItems[itemId][1])
            local itemCount   = sealOption[2]
            eventParams[invaderXim.seals.sealItems[itemId][1] + 2] = bit.lshift(storedSeals + itemCount, 16)
            table.insert(confirmedSeals, { itemId, itemCount })
        end

        player:startEvent(unpack(eventParams))
        for _, sealData in ipairs(confirmedSeals) do
            local itemId = sealData[1]
            local sealId = invaderXim.seals.sealItems[itemId][1]
            local sealCount = sealData[2]
            trade:confirmItem(itemId, sealCount)
            player:addSeals(sealCount, sealId)
        end

        player:confirmTrade()

        return true
    end

    return false
end
