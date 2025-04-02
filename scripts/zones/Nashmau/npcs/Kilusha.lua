-----------------------------------
-- Area: Nashmau
--  NPC: Kilusha
-- Einherjar-related NPC, Smoldering Glass, Therion Ichor items
-- !pos 0.373 -6.667 14.712 53
-----------------------------------
local ID = zones[invaderXim.zone.NASHMAU]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local lampCost = invaderXim.einherjar.settings.SMOLDERING_LAMP_BASE_COST -- base cost without RHAPSODY_IN_AZURE key item

    if player:hasKeyItem(invaderXim.ki.RHAPSODY_IN_AZURE) then
        lampCost = 1000
    end

    if
        npcUtil.tradeHasExactly(trade, { { 'gil', lampCost } }) and
        player:getCharVar('EinherjarIntro') ~= 1
    then
        if
            player:getFreeSlotsCount() == 0 or
            player:hasItem(invaderXim.item.SMOLDERING_LAMP)
        then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINEDX, invaderXim.item.SMOLDERING_LAMP)
            return
        end

        player:startEvent(25) -- Lamp given in onEventFinish
    end
end

entity.onTrigger = function(player, npc)
    local ichor               = player:getCurrency('therion_ichor')
    local allowValkyrieBuying = 29360128 -- set this to 0 if you wish to allow players to buy feather key items without KI
    local lampCost            = invaderXim.einherjar.settings.SMOLDERING_LAMP_BASE_COST -- base cost without RHAPSODY_IN_AZURE key item
    local reentryTime         = invaderXim.einherjar.settings.EINHERJAR_REENTRY_TIME -- in hours
    local toau                = player:hasCompletedMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.IMMORTAL_SENTRIES)

    if player:hasKeyItem(invaderXim.ki.RHAPSODY_IN_AZURE) then
        lampCost = 1000
        reentryTime = 1
    end

    if player:hasKeyItem(invaderXim.ki.MARK_OF_THE_EINHERJAR) then -- June 2012 update added Valkyrie items
        allowValkyrieBuying = 0
    end

    if
        player:getMainLvl() < invaderXim.einherjar.settings.EINHERJAR_LEVEL_MIN or
        not toau
    then
        player:startEvent(22) -- worthless CS
    elseif
        (player:getMainLvl() >= invaderXim.einherjar.settings.EINHERJAR_LEVEL_MIN or toau) and
        player:getCharVar('EinherjarIntro') == 1
    then
        player:startEvent(23, lampCost, 856, 3, 616, 10, 172, 172, 0) -- Einherjar introduction
    else
        player:startEvent(24, lampCost, 856, 3, reentryTime, 10, 135, allowValkyrieBuying, ichor)
        player:setLocalVar('reentryTime', reentryTime)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 24 and option == 6 then -- about Entry Conditions
        player:updateEvent(53, 10, 3, player:getLocalVar('reentryTime'), 10, 231, invaderXim.item.SMOLDERING_LAMP, invaderXim.item.GLOWING_LAMP)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 23 then
        player:setCharVar('EinherjarIntro', 0) -- deletes CharVar set at character creation
    elseif csid == 25 then
        -- Give players their purchased lamp
        if npcUtil.giveItem(player, invaderXim.item.SMOLDERING_LAMP) then
            player:confirmTrade()
        end
    elseif csid == 24 and option ~= utils.EVENT_CANCELLED_OPTION and option ~= 0 then
        local kilushaItems =
        {
            [1] =  { item = invaderXim.item.ANIMATOR_P1,          cost =  15000 },
            [2] =  { item = invaderXim.item.ASLAN_CAPE,           cost =  15000 },
            [3] =  { item = invaderXim.item.GLEEMANS_CAPE,        cost =  15000 },
            [4] =  { item = invaderXim.item.RITTER_GORGET,        cost =  15000 },
            [5] =  { item = invaderXim.item.KUBIRA_BEAD_NECKLACE, cost =  15000 },
            [6] =  { item = invaderXim.item.MORGANAS_CHOKER,      cost =  15000 },
            [7] =  { item = invaderXim.item.BUCCANEERS_BELT,      cost =  15000 },
            [8] =  { item = invaderXim.item.IOTA_RING,            cost =  15000 },
            [9] =  { item = invaderXim.item.OMEGA_RING,           cost =  15000 },
            [10] = { item = invaderXim.item.DELTA_EARRING,        cost =  15000 },
            [11] = { item = invaderXim.item.RUBBER_CAP,           cost =   5000 },
            [12] = { item = invaderXim.item.RUBBER_HARNESS,       cost =   5000 },
            [13] = { item = invaderXim.item.RUBBER_GLOVES,        cost =   5000 },
            [14] = { item = invaderXim.item.RUBBER_CHAUSSES,      cost =   5000 },
            [15] = { item = invaderXim.item.RUBBER_SOLES,         cost =   5000 },
            [16] = { item = invaderXim.item.NETHEREYE_CHAIN,      cost =   5000 },
            [17] = { item = invaderXim.item.NETHERFIELD_CHAIN,    cost =   5000 },
            [18] = { item = invaderXim.item.NETHERSPIRIT_CHAIN,   cost =   5000 },
            [19] = { item = invaderXim.item.NETHERCANT_CHAIN,     cost =   5000 },
            [20] = { item = invaderXim.item.NETHERPACT_CHAIN,     cost =   5000 },
            [21] = { item = invaderXim.item.BALRAHNS_EYEPATCH,    cost = 100000 },
            [22] = { item = invaderXim.item.VALKYRIES_TEAR,       cost =   1000 },
            [23] = { item = invaderXim.item.VALKYRIES_WING,       cost =   2000 },
            [24] = { item = invaderXim.item.VALKYRIES_SOUL,       cost =   3000 },
        }

        local row = kilushaItems[option]

        if player:getCurrency('therion_ichor') >= row.cost then
            if npcUtil.giveItem(player, row.item) then
                player:delCurrency('therion_ichor', row.cost)
            end
        end
    end
end

return entity
