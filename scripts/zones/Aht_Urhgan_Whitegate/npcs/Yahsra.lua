-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Yahsra
-- Type: Assault Mission Giver
-- !pos 120.967 0.161 -44.002 50
-----------------------------------
---@type TNpcEntity
local entity = {}

local items =
{
    [1]  = { itemid = invaderXim.item.STOIC_EARRING,                price =  3000 },
    [2]  = { itemid = invaderXim.item.UNFETTERED_RING,              price =  5000 },
    [3]  = { itemid = invaderXim.item.TEMPERED_CHAIN,               price =  8000 },
    [4]  = { itemid = invaderXim.item.POTENT_BELT,                  price = 10000 },
    [5]  = { itemid = invaderXim.item.MIRACULOUS_CAPE,              price = 10000 },
    [6]  = { itemid = invaderXim.item.YIGIT_BULAWA,                 price = 10000 },
    [7]  = { itemid = invaderXim.item.IMPERIAL_BHUJ,                price = 15000 },
    [8]  = { itemid = invaderXim.item.PAHLUWAN_PATAS,               price = 15000 },
    [9]  = { itemid = invaderXim.item.AMIR_KOLLUKS,                 price = 15000 },
    [10] = { itemid = invaderXim.item.PAHLUWAN_QALANSUWA,           price = 20000 },
    [11] = { itemid = invaderXim.item.YIGIT_SERAWEELS,              price = 20000 },
    [12] = { itemid = invaderXim.item.CIPHER_OF_OVJANGS_ALTER_EGO,  price  = 3000 },
    [13] = { itemid = invaderXim.item.CIPHER_OF_MNEJINGS_ALTER_EGO, price =  3000 },
}

entity.onTrigger = function(player, npc)
    local rank = invaderXim.besieged.getMercenaryRank(player)
    local haveimperialIDtag = player:hasKeyItem(invaderXim.ki.IMPERIAL_ARMY_ID_TAG) and 1 or 0
    local assaultPoints = player:getAssaultPoint(invaderXim.assault.assaultArea.LEUJAOAM_SANCTUM)
    local cipher = 0
    local active = invaderXim.extravaganza.campaignActive()

    if
        active == invaderXim.extravaganza.campaign.SPRING_FALL or
        active == invaderXim.extravaganza.campaign.BOTH
    then
        cipher = 1
    end

    if rank > 0 then
        player:startEvent(273, rank, haveimperialIDtag, assaultPoints, player:getCurrentAssault(), cipher)
    else
        player:startEvent(279)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    local selectiontype = bit.band(option, 0xF)
    if csid == 273 and selectiontype == 2 then
        local item = bit.rshift(option, 14)
        local choice = items[item]
        local assaultPoints = player:getAssaultPoint(invaderXim.assault.assaultArea.LEUJAOAM_SANCTUM)
        local canEquip = player:canEquipItem(choice.itemid) and 2 or 0

        player:updateEvent(0, 0, assaultPoints, 0, canEquip)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 273 then
        local selectiontype = bit.band(option, 0xF)
        if
            selectiontype == 1 and
            npcUtil.giveKeyItem(player, invaderXim.ki.LEUJAOAM_ASSAULT_ORDERS)
        then
            -- taken assault mission
            player:addAssault(bit.rshift(option, 4))
            player:delKeyItem(invaderXim.ki.IMPERIAL_ARMY_ID_TAG)
            player:addKeyItem(invaderXim.ki.MAP_OF_LEUJAOAM_SANCTUM)
        elseif selectiontype == 2 then
            -- purchased an item
            local item = bit.rshift(option, 14)
            local choice = items[item]
            if choice and npcUtil.giveItem(player, choice.itemid) then
                player:delAssaultPoint(invaderXim.assault.assaultArea.LEUJAOAM_SANCTUM, choice.price)
            end
        end
    end
end

return entity
