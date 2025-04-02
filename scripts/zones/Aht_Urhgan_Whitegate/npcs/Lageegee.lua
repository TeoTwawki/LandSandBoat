-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Lageegee
-- Type: Assault Mission Giver
-- !pos 120.808 0.161 -30.435
-----------------------------------
---@type TNpcEntity
local entity = {}

local items =
{
    [1]  = { itemid = invaderXim.item.VISION_EARRING,               price =  3000 },
    [2]  = { itemid = invaderXim.item.UNYIELDING_RING,              price =  5000 },
    [3]  = { itemid = invaderXim.item.FORTIFIED_CHAIN,              price =  8000 },
    [4]  = { itemid = invaderXim.item.RESOLUTE_BELT,                price = 10000 },
    [5]  = { itemid = invaderXim.item.BUSHIDO_CAPE,                 price = 10000 },
    [6]  = { itemid = invaderXim.item.KHANJAR,                      price = 15000 },
    [7]  = { itemid = invaderXim.item.HOTARUMARU,                   price = 15000 },
    [8]  = { itemid = invaderXim.item.IMPERIAL_GUN,                 price = 15000 },
    [9]  = { itemid = invaderXim.item.AMIR_PUGGAREE,                price = 20000 },
    [10] = { itemid = invaderXim.item.PAHLUWAN_CRACKOWS,            price = 20000 },
    [11] = { itemid = invaderXim.item.YIGIT_GOMLEK,                 price = 20000 },
    [12] = { itemid = invaderXim.item.CIPHER_OF_OVJANGS_ALTER_EGO,  price =  3000 },
    [13] = { itemid = invaderXim.item.CIPHER_OF_MNEJINGS_ALTER_EGO, price =  3000 },
}

entity.onTrigger = function(player, npc)
    local rank = invaderXim.besieged.getMercenaryRank(player)
    local haveimperialIDtag = player:hasKeyItem(invaderXim.ki.IMPERIAL_ARMY_ID_TAG) and 1 or 0
    local assaultPoints = player:getAssaultPoint(invaderXim.assault.assaultArea.PERIQIA)
    local cipher = 0
    local active = invaderXim.extravaganza.campaignActive()

    if
        active == invaderXim.extravaganza.campaign.SPRING_FALL or
        active == invaderXim.extravaganza.campaign.BOTH
    then
        cipher = 1
    end

    if rank > 0 then
        player:startEvent(276, rank, haveimperialIDtag, assaultPoints, player:getCurrentAssault(), cipher)
    else
        player:startEvent(282)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    local selectiontype = bit.band(option, 0xF)
    if csid == 276 and selectiontype == 2 then
        local item = bit.rshift(option, 14)
        local choice = items[item]
        local assaultPoints = player:getAssaultPoint(invaderXim.assault.assaultArea.PERIQIA)
        local canEquip = player:canEquipItem(choice.itemid) and 2 or 0

        player:updateEvent(0, 0, assaultPoints, 0, canEquip)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 276 then
        local selectiontype = bit.band(option, 0xF)
        if
            selectiontype == 1 and
            npcUtil.giveKeyItem(player, invaderXim.ki.PERIQIA_ASSAULT_ORDERS)
        then
            -- taken assault mission
            player:addAssault(bit.rshift(option, 4))
            player:delKeyItem(invaderXim.ki.IMPERIAL_ARMY_ID_TAG)
            player:addKeyItem(invaderXim.ki.MAP_OF_PERIQIA)
        elseif selectiontype == 2 then
            -- purchased an item
            local item = bit.rshift(option, 14)
            local choice = items[item]
            if choice and npcUtil.giveItem(player, choice.itemid) then
                player:delAssaultPoint(invaderXim.assault.assaultArea.PERIQIA, choice.price)
            end
        end
    end
end

return entity
