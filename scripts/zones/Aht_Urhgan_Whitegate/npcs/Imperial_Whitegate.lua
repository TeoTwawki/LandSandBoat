-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Imperial Whitegate
-- pos: 152, -2, 0, 50
-----------------------------------
local whitegateShared = require('scripts/zones/Aht_Urhgan_Whitegate/Shared')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local noWeapons = player:getEquipID(invaderXim.slot.MAIN) == 0 and player:getEquipID(invaderXim.slot.SUB) == 0

    if
        player:getCurrentMission(invaderXim.mission.log_id.TOAU) == invaderXim.mission.id.toau.IMPERIAL_CORONATION and
        whitegateShared.doRoyalPalaceArmorCheck(player) and
        noWeapons
    then
        player:startEvent(3140, invaderXim.besieged.getMercenaryRank(player), player:getTitle(), 0, 0, 0, 0, 0, 0, 0)
    elseif
        player:getCurrentMission(invaderXim.mission.log_id.TOAU) >= invaderXim.mission.id.toau.IMPERIAL_CORONATION and
        whitegateShared.doRoyalPalaceArmorCheck(player) and
        noWeapons
    then
        local ring      = player:getCharVar('TOAU_RINGTIME')
        local ringParam = 0

        if ring == 0 then
            ringParam = 1
        end

        local standardParam = 0
        if not player:hasItem(invaderXim.item.IMPERIAL_STANDARD) then
            standardParam = 1
        end

        if ringParam > 0 or standardParam > 0 then
            player:startEvent(3155, standardParam, ringParam, 0, 0, 0, 0, 0, 0, 0)
        end
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 3140 or csid == 3155 then
        if option == 1 and npcUtil.giveItem(player, invaderXim.item.BALRAHNS_RING) then
            player:setCharVar('TOAU_RINGTIME', os.time())
            player:setCharVar('TOAU_RINGRECV', 1)
        elseif option == 2 and npcUtil.giveItem(player, invaderXim.item.ULTHALAMS_RING) then
            player:setCharVar('TOAU_RINGTIME', os.time())
            player:setCharVar('TOAU_RINGRECV', 1)
        elseif option == 3 and npcUtil.giveItem(player, invaderXim.item.JALZAHNS_RING) then
            player:setCharVar('TOAU_RINGTIME', os.time())
            player:setCharVar('TOAU_RINGRECV', 1)
        elseif option == 4 then
            npcUtil.giveItem(player, invaderXim.item.IMPERIAL_STANDARD)
        elseif option == 99 then
            player:updateEvent(invaderXim.item.BALRAHNS_RING, invaderXim.item.ULTHALAMS_RING, invaderXim.item.JALZAHNS_RING)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 3140 and player:getCharVar('TOAU_RINGRECV') == 1 then
        player:completeMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.IMPERIAL_CORONATION)
        player:addMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.THE_EMPRESS_CROWNED)
        player:setCharVar('TOAU_RINGRECV', 0)
    elseif csid == 3155 and option == 6 then
        npcUtil.giveItem(player, invaderXim.item.IMPERIAL_STANDARD)
    end
end

return entity
