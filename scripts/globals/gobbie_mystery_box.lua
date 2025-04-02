-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.gobbieMysteryBox = invaderXim.gobbieMysteryBox or {}

local adoulinOptionOff = 0x80
local pictlogicaOptionOff = 0x100
local wantedOptionOff = 0x1000
local hideOptionFlags = adoulinOptionOff + pictlogicaOptionOff + wantedOptionOff
local costs =
{
    [1] = 10,
    [2] = 10,
    [3] = 10,
    [4] = 10,
    [5] = 10,
    [6] = 50
}

local keyToDial =
{
    [8973] = 6,  -- special dial
    [9217] = 9,  -- abjuration
    [9218] = 10, -- fortune
--  [????] = 11, -- furnishing
    [9274] = 13, -- anniversary
}

local abjurationItems =
{
    invaderXim.item.DRYADIC_ABJURATION_HEAD,
    invaderXim.item.DRYADIC_ABJURATION_BODY,
    invaderXim.item.DRYADIC_ABJURATION_HANDS,
    invaderXim.item.DRYADIC_ABJURATION_LEGS,
    invaderXim.item.DRYADIC_ABJURATION_FEET,
    invaderXim.item.EARTHEN_ABJURATION_HEAD,
    invaderXim.item.EARTHEN_ABJURATION_BODY,
    invaderXim.item.EARTHEN_ABJURATION_HANDS,
    invaderXim.item.EARTHEN_ABJURATION_LEGS,
    invaderXim.item.EARTHEN_ABJURATION_FEET,
    invaderXim.item.AQUARIAN_ABJURATION_HEAD,
    invaderXim.item.AQUARIAN_ABJURATION_BODY,
    invaderXim.item.AQUARIAN_ABJURATION_HANDS,
    invaderXim.item.AQUARIAN_ABJURATION_LEGS,
    invaderXim.item.AQUARIAN_ABJURATION_FEET,
    invaderXim.item.MARTIAL_ABJURATION_HEAD,
    invaderXim.item.MARTIAL_ABJURATION_BODY,
    invaderXim.item.MARTIAL_ABJURATION_HANDS,
    invaderXim.item.MARTIAL_ABJURATION_LEGS,
    invaderXim.item.MARTIAL_ABJURATION_FEET,
    invaderXim.item.WYRMAL_ABJURATION_HEAD,
    invaderXim.item.WYRMAL_ABJURATION_BODY,
    invaderXim.item.WYRMAL_ABJURATION_HANDS,
    invaderXim.item.WYRMAL_ABJURATION_LEGS,
    invaderXim.item.WYRMAL_ABJURATION_FEET,
    invaderXim.item.NEPTUNAL_ABJURATION_HEAD,
    invaderXim.item.NEPTUNAL_ABJURATION_BODY,
    invaderXim.item.NEPTUNAL_ABJURATION_HANDS,
    invaderXim.item.NEPTUNAL_ABJURATION_LEGS,
    invaderXim.item.NEPTUNAL_ABJURATION_FEET,
    invaderXim.item.LIBATION_ABJURATION,
    invaderXim.item.OBLATION_ABJURATION,
    invaderXim.item.PHANTASMAL_ABJURATION_HEAD,
    invaderXim.item.PHANTASMAL_ABJURATION_BODY,
    invaderXim.item.PHANTASMAL_ABJURATION_HANDS,
    invaderXim.item.PHANTASMAL_ABJURATION_LEGS,
    invaderXim.item.PHANTASMAL_ABJURATION_FEET,
    invaderXim.item.HADEAN_ABJURATION_HEAD,
    invaderXim.item.HADEAN_ABJURATION_BODY,
    invaderXim.item.HADEAN_ABJURATION_HANDS,
    invaderXim.item.HADEAN_ABJURATION_LEGS,
    invaderXim.item.HADEAN_ABJURATION_FEET,
    invaderXim.item.CORVINE_ABJURATION_HEAD,
    invaderXim.item.CORVINE_ABJURATION_BODY,
    invaderXim.item.CORVINE_ABJURATION_HANDS,
    invaderXim.item.CORVINE_ABJURATION_LEGS,
    invaderXim.item.CORVINE_ABJURATION_FEET,
    invaderXim.item.SUPERNAL_ABJURATION_HEAD,
    invaderXim.item.SUPERNAL_ABJURATION_BODY,
    invaderXim.item.SUPERNAL_ABJURATION_HANDS,
    invaderXim.item.SUPERNAL_ABJURATION_LEGS,
    invaderXim.item.SUPERNAL_ABJURATION_FEET,
    invaderXim.item.TRANSITORY_ABJURATION_HEAD,
    invaderXim.item.TRANSITORY_ABJURATION_BODY,
    invaderXim.item.TRANSITORY_ABJURATION_HANDS,
    invaderXim.item.TRANSITORY_ABJURATION_LEGS,
    invaderXim.item.TRANSITORY_ABJURATION_FEET,
    invaderXim.item.FOREBODING_ABJURATION_HEAD,
    invaderXim.item.FOREBODING_ABJURATION_BODY,
    invaderXim.item.FOREBODING_ABJURATION_HANDS,
    invaderXim.item.FOREBODING_ABJURATION_LEGS,
    invaderXim.item.FOREBODING_ABJURATION_FEET,
    invaderXim.item.LENITIVE_ABJURATION_HEAD,
    invaderXim.item.LENITIVE_ABJURATION_BODY,
    invaderXim.item.LENITIVE_ABJURATION_HANDS,
    invaderXim.item.LENITIVE_ABJURATION_LEGS,
    invaderXim.item.LENITIVE_ABJURATION_FEET,
    invaderXim.item.BUSHIN_ABJURATION_HEAD,
    invaderXim.item.BUSHIN_ABJURATION_BODY,
    invaderXim.item.BUSHIN_ABJURATION_HANDS,
    invaderXim.item.BUSHIN_ABJURATION_LEGS,
    invaderXim.item.BUSHIN_ABJURATION_FEET,
    invaderXim.item.VALE_ABJURATION_HEAD,
    invaderXim.item.VALE_ABJURATION_BODY,
    invaderXim.item.VALE_ABJURATION_HANDS,
    invaderXim.item.VALE_ABJURATION_LEGS,
    invaderXim.item.VALE_ABJURATION_FEET,
    invaderXim.item.GROVE_ABJURATION_HEAD,
    invaderXim.item.GROVE_ABJURATION_BODY,
    invaderXim.item.GROVE_ABJURATION_HANDS,
    invaderXim.item.GROVE_ABJURATION_LEGS,
    invaderXim.item.GROVE_ABJURATION_FEET,
    invaderXim.item.TRITON_ABJURATION_HEAD,
    invaderXim.item.TRITON_ABJURATION_BODY,
    invaderXim.item.TRITON_ABJURATION_HANDS,
    invaderXim.item.TRITON_ABJURATION_LEGS,
    invaderXim.item.TRITON_ABJURATION_FEET,
    invaderXim.item.SHINRYU_ABJURATION_HEAD,
    invaderXim.item.SHINRYU_ABJURATION_BODY,
    invaderXim.item.SHINRYU_ABJURATION_HANDS,
    invaderXim.item.SHINRYU_ABJURATION_LEGS,
    invaderXim.item.SHINRYU_ABJURATION_FEET,
    invaderXim.item.ABYSSAL_ABJURATION_HEAD,
    invaderXim.item.ABYSSAL_ABJURATION_BODY,
    invaderXim.item.ABYSSAL_ABJURATION_HANDS,
    invaderXim.item.ABYSSAL_ABJURATION_LEGS,
    invaderXim.item.ABYSSAL_ABJURATION_FEET,
    invaderXim.item.CRONIAN_ABJURATION_HEAD,
    invaderXim.item.CRONIAN_ABJURATION_BODY,
    invaderXim.item.CRONIAN_ABJURATION_HANDS,
    invaderXim.item.CRONIAN_ABJURATION_LEGS,
    invaderXim.item.CRONIAN_ABJURATION_FEET,
    invaderXim.item.AREAN_ABJURATION_HEAD,
    invaderXim.item.AREAN_ABJURATION_BODY,
    invaderXim.item.AREAN_ABJURATION_HANDS,
    invaderXim.item.AREAN_ABJURATION_LEGS,
    invaderXim.item.AREAN_ABJURATION_FEET,
    invaderXim.item.JOVIAN_ABJURATION_HEAD,
    invaderXim.item.JOVIAN_ABJURATION_BODY,
    invaderXim.item.JOVIAN_ABJURATION_HANDS,
    invaderXim.item.JOVIAN_ABJURATION_LEGS,
    invaderXim.item.JOVIAN_ABJURATION_FEET,
    invaderXim.item.VENERIAN_ABJURATION_HEAD,
    invaderXim.item.VENERIAN_ABJURATION_BODY,
    invaderXim.item.VENERIAN_ABJURATION_HANDS,
    invaderXim.item.VENERIAN_ABJURATION_LEGS,
    invaderXim.item.VENERIAN_ABJURATION_FEET,
    invaderXim.item.CYLLENIAN_ABJURATION_HEAD,
    invaderXim.item.CYLLENIAN_ABJURATION_BODY,
    invaderXim.item.CYLLENIAN_ABJURATION_HANDS,
    invaderXim.item.CYLLENIAN_ABJURATION_LEGS,
    invaderXim.item.CYLLENIAN_ABJURATION_FEET,
}

local fortuneItems =
{
    invaderXim.item.FRAYED_POUCH_OF_BIRTH,
    invaderXim.item.FRAYED_POUCH_OF_ADVANCEMENT,
    invaderXim.item.FRAYED_POUCH_OF_GLORY,
    invaderXim.item.FRAYED_POUCH_OF_DECAY,
    invaderXim.item.FRAYED_POUCH_OF_RUIN,
    invaderXim.item.FRAYED_SACK_OF_ABUNDANCE_P1,
    invaderXim.item.FRAYED_SACK_OF_ABUNDANCE_P2,
    invaderXim.item.FRAYED_SACK_OF_MORTALITY_P1,
    invaderXim.item.FRAYED_SACK_OF_MORTALITY_P2,
    invaderXim.item.FRAYED_SACK_OF_DEVIOUSNESS,
    invaderXim.item.FRAYED_SACK_OF_LIMINALITY,
    invaderXim.item.COTTON_COIN_PURSE,
    invaderXim.item.LINEN_COIN_PURSE,
    invaderXim.item.PLUTON_CASE,
    invaderXim.item.BEITETSU_PARCEL,
    invaderXim.item.BOULDER_CASE,
    invaderXim.item.PLUTON_BOX,
    invaderXim.item.BEITETSU_BOX,
    invaderXim.item.BOULDER_BOX,
    invaderXim.item.FRAYED_SACK_OF_HORROR_P1,
    invaderXim.item.FRAYED_SACK_OF_HORROR_P2,
    invaderXim.item.FRAYED_SACK_OF_BEAUTY,
    invaderXim.item.FRAYED_SACK_OF_SPLENDOR,
    invaderXim.item.FRAYED_SACK_OF_FECUNDITY,
    invaderXim.item.FRAYED_SACK_OF_PLENTY,
    invaderXim.item.FRAYED_SACK_OF_OPULENCE,
    invaderXim.item.AGED_BOX_BAYLD,
    invaderXim.item.HEAVY_METAL_POUCH,
}
local anniversaryItems =
{
    -- TODO: The anniversary item table needs to be populated
    invaderXim.item.DIAL_KEY_ANV, -- just give them back their key until this table can be populated
}

local gobbieJunk =
{
    invaderXim.item.GOBLIN_MESS_TIN,
    invaderXim.item.GOBLIN_WEEL,
    invaderXim.item.CHUNK_OF_HOBGOBLIN_CHOCOLATE,
    invaderXim.item.HOBGOBLIN_PIE,
    invaderXim.item.LOAF_OF_HOBGOBLIN_BREAD,
    invaderXim.item.LOAF_OF_GOBLIN_BREAD,
    invaderXim.item.CHUNK_OF_GOBLIN_CHOCOLATE,
    invaderXim.item.GOBLIN_PIE,
}

invaderXim.gobbieMysteryBox.onTrade = function(player, npc, trade, events)
    if trade:getItemCount() == 1 then
        local tradeID = trade:getItemId(0)
        if keyToDial[tradeID] ~= nil then
            -- TODO: Without campaigns, there's currently no method for obtaining keys
            if player:getFreeSlotsCount() == 0 then
                player:startEvent(events.FULL_INV, tradeID, keyToDial[tradeID])
                return false
            end

            player:setLocalVar('gobbieBoxKey', tradeID)
            player:startEvent(events.KEY_TRADE, tradeID, keyToDial[tradeID])
        else -- trade for points
            -- TODO: Point system needs to be defined
            return false
        end
    else
        return false
    end
end

invaderXim.gobbieMysteryBox.onTrigger = function(player, npc, events)
    local event = events
    local playerAgeDays = (os.time() - player:getTimeCreated()) / 86400
    local dailyTallyPoints = player:getCurrency('daily_tally')
    local firstVisit = dailyTallyPoints == -1
    local gobbieBoxUsed = player:getCharVar('gobbieBoxUsed')
    local specialDialUsed = utils.mask.getBit(gobbieBoxUsed, 0) and 1 or 0
    local adoulinDialUsed = utils.mask.getBit(gobbieBoxUsed, 1) and 1 or 0
    local pictlogicaDialUsed = utils.mask.getBit(gobbieBoxUsed, 2) and 1 or 0
    local wantedDialUsed = utils.mask.getBit(gobbieBoxUsed, 3) and 1 or 0
    local holdingItem = player:getCharVar('gobbieBoxHoldingItem')

    if playerAgeDays >= invaderXim.settings.main.GOBBIE_BOX_MIN_AGE and firstVisit then
        player:startEvent(event.INTRO)
    elseif playerAgeDays >= invaderXim.settings.main.GOBBIE_BOX_MIN_AGE then
        if holdingItem ~= 0 then
            player:startEvent(event.HOLDING_ITEM)
        else
            player:startEvent(event.DEFAULT, specialDialUsed, adoulinDialUsed, pictlogicaDialUsed, wantedDialUsed, 0, 0, hideOptionFlags, dailyTallyPoints)
        end
    else
        player:messageSpecial(zones[player:getZoneID()].text.YOU_MUST_WAIT_ANOTHER_N_DAYS, invaderXim.settings.main.GOBBIE_BOX_MIN_AGE - playerAgeDays + 1)
    end
end

invaderXim.gobbieMysteryBox.onEventUpdate = function(player, csid, option, events)
    local event = events
    local dailyTallyPoints = player:getCurrency('daily_tally')
    local holdingItem = player:getCharVar('gobbieBoxHoldingItem')
    local gobbieBoxUsed = player:getCharVar('gobbieBoxUsed')
    local specialDialUsed = utils.mask.getBit(gobbieBoxUsed, 0) and 1 or 0
    local adoulinDialUsed = utils.mask.getBit(gobbieBoxUsed, 1) and 1 or 0
    local pictlogicaDialUsed = utils.mask.getBit(gobbieBoxUsed, 2) and 1 or 0
    local wantedDialUsed = utils.mask.getBit(gobbieBoxUsed, 3) and 1 or 0
    local itemID = 0

    if csid == event.KEY_TRADE then
        if option == 1 then
            local keyID = player:getLocalVar('gobbieBoxKey')
            player:setLocalVar('gobbieBoxKey', 0)
            switch (keyToDial[keyID]): caseof
            {
                [6] = function()
                    itemID = SelectDailyItem(player, 6)
                end,  -- special dial

                [9] = function() -- abjuration
                    itemID = abjurationItems[math.random(1, #abjurationItems)]
                    if player:hasItem(itemID) then
                        itemID = gobbieJunk[math.random(1, #gobbieJunk)]
                    end
                end,

                [10] = function()
                    itemID = fortuneItems[math.random(1, #fortuneItems)]
                end, -- fortune

            --  [??] = function()  end, -- furnishing

                [13] = function()-- anniversary
                    if math.random(1, 100) == 1 then -- 1% chance for ANV exclusive item?
                        itemID = anniversaryItems[math.random(1, #anniversaryItems)]
                    else
                        itemID = SelectDailyItem(player, 6)
                    end
                end
            }

            player:setCharVar('gobbieBoxHoldingItem', itemID)
            player:tradeComplete()
            player:updateEvent(itemID, keyToDial[keyID], 3)
        elseif option == 2 then
            if holdingItem > 0 and npcUtil.giveItem(player, holdingItem) then
                player:setCharVar('gobbieBoxHoldingItem', 0)
            end

            player:updateEvent(itemID, 0)
        end
    elseif csid == event.DEFAULT then
        if option == 4 then
            player:updateEvent(SelectDailyItem(player, 6), SelectDailyItem(player, 6), SelectDailyItem(player, 6), 0, 0, 0, 0, dailyTallyPoints) -- peek
        else
            local dial = math.floor(option / 8)
            local optionType = option % 8
            local dialUsed = false
            local dialCost = costs[dial]
            local dialMask = nil

            if dial >= 6 then
                dialMask = dial - 6
                dialUsed = utils.mask.getBit(gobbieBoxUsed, dialMask)
            end

            switch (optionType): caseof
            {
                [1] = function()
                    if dialUsed then
                        player:updateEvent(1, dial, 2) -- already used this dial
                    elseif dailyTallyPoints >= dialCost then
                        itemID = SelectDailyItem(player, dial)
                        player:setCharVar('gobbieBoxHoldingItem', itemID)
                        player:setCurrency('daily_tally', dailyTallyPoints - dialCost)
                        if dialMask then
                            player:setCharVar('gobbieBoxUsed', utils.mask.setBit(gobbieBoxUsed, dialMask, true))
                        end

                        player:updateEvent(itemID, dial, 0)
                    else
                        player:updateEvent(1, dial, 1) -- not enough points
                    end
                end,

                [2] = function()
                    if player:getFreeSlotsCount() == 0 then
                        player:updateEvent(holdingItem, 0, 0, 1) -- inventory full, exit event
                        player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED + 2) -- generic 'Cannot obtain the item.'
                    end
                end,

                [5] = function()
                    if holdingItem > 0 and npcUtil.giveItem(player, holdingItem) then
                        player:setCharVar('gobbieBoxHoldingItem', 0)
                    end

                    player:updateEvent(specialDialUsed, adoulinDialUsed, pictlogicaDialUsed, wantedDialUsed, 0, 0, hideOptionFlags, dailyTallyPoints)
                end,
            }
        end
    end
end

invaderXim.gobbieMysteryBox.onEventFinish = function(player, csid, option, events)
    local event = events
    if csid == event.INTRO then
        player:setCurrency('daily_tally', 50)
    elseif csid == event.HOLDING_ITEM then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED + 2) -- generic 'Cannot obtain the item.'
        elseif npcUtil.giveItem(player, player:getCharVar('gobbieBoxHoldingItem')) then
            player:setCharVar('gobbieBoxHoldingItem', 0)
        end
    end
end
