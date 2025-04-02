-----------------------------------
--  Artisan Moogles
-----------------------------------
xi = xi or {}
invaderXim.artisan = invaderXim.artisan or {}

local event =
{
    [invaderXim.zone.BASTOK_MARKETS] = 544,
    [invaderXim.zone.WINDURST_WOODS] = 833,
    [invaderXim.zone.RULUDE_GARDENS] = 10162,
    [invaderXim.zone.SOUTHERN_SAN_DORIA] = 960
}

local menuFlags =
{
    expand = 0x8,
    abags = 0x4,
    aexpand = 0x2,
}

invaderXim.artisan.moogleOnTrigger = function(player, npc)
    local csid = event[player:getZoneID()]
    local menuMask = 0
    local sackSize = player:getContainerSize(invaderXim.inv.MOGSACK)
    local mogVisited = (sackSize > 0 or player:getCharVar('[artisan]visited') > 0) and 1 or 0
    if mogVisited == 0 then
        player:setCharVar('[artisan]visited', 1)
    end

    if sackSize > 0 then
        sackSize = sackSize + 1
    else
        menuMask = menuFlags.expand + menuFlags.aexpand
    end

    player:startEvent(csid, 0, 0, 0, sackSize, 0, 0, menuMask, mogVisited)
end

invaderXim.artisan.moogleOnUpdate = function(player, csid, option, npc)
    if option == 1 then -- Buy sack
        if player:getGil() >= 9980 and player:getContainerSize(invaderXim.inv.MOGSACK) == 0 then
            player:delGil(9980)
            player:changeContainerSize(invaderXim.inv.MOGSACK, 30)
            player:setCharVar('[artisan]visited', 0)
            player:updateEvent(0, 0, 0, 30 + 1, 0, 0, 0, 2)
        end

    elseif option == 2 then -- Expand sack
        local sackSize = player:getContainerSize(invaderXim.inv.MOGSACK)
        local gobbieSize = player:getContainerSize(invaderXim.inv.INVENTORY)
        local gobbieCanUpgrade = gobbieSize < 80 and 1 or 0
        if sackSize < gobbieSize and sackSize > 0 then
            player:changeContainerSize(invaderXim.inv.MOGSACK, gobbieSize - sackSize)
            player:updateEvent((gobbieSize - 30) / 5, 0, 0, player:getContainerSize(invaderXim.inv.MOGSACK) + 1, 0, 0, 2, 0)
        else
            player:updateEvent(0, 0, 0, 0, 0, 0, gobbieCanUpgrade, 0)
        end

    elseif option == 3 then -- Client requests sack + scroll status
        local scrollAvail = player:getCharVar('[artisan]nextScroll') < getMidnight() and 1 or 0
        local sackSize = player:getContainerSize(invaderXim.inv.MOGSACK)
        if sackSize > 0 then
            sackSize = sackSize + 1
        end

        player:updateEvent(0, 0, 0, sackSize, 0, 0, 0, scrollAvail)

    elseif option == 4 then -- Main dialogue
        local scrollAvail = player:getCharVar('[artisan]nextScroll') < getMidnight() and 1 or 0
        local sackSize = player:getContainerSize(invaderXim.inv.MOGSACK)
        if sackSize > 0 then
            sackSize = sackSize + 1
        end

        player:updateEvent(0, 0, player:getGil(), sackSize, 0, 0, 0, scrollAvail)
    end
end

invaderXim.artisan.moogleOnFinish = function(player, csid, option, npc)
    if option == 99 then -- Get Scroll
        if player:getCharVar('[artisan]nextScroll') < getMidnight() then
            if npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_INSTANT_WARP) then
                player:setCharVar('[artisan]nextScroll', getMidnight())
            end
        end
    end
end
