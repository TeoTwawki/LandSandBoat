-----------------------------------
-- Area: Apollyon
--  NPC: Sentinel_Column
-- !pos 643 0 -609 38
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, invaderXim.item.METAL_CHIP) then
        player:startEvent(221, 65)
    elseif npcUtil.tradeHas(trade, { invaderXim.item.SMALT_CHIP, invaderXim.item.SMOKY_CHIP, invaderXim.item.CHARCOAL_CHIP, invaderXim.item.MAGENTA_CHIP }) then
        player:startEvent(221, 33)
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(221, 31)
end

entity.onEventUpdate = function(player, csid, option, npc)
    player:updateEvent(
        0,
        GetServerVariable('[SW_APOLLYON]Time'),      -- SW Apollyon
        GetServerVariable('[NW_APOLLYON]Time'),      -- NW Apollyon
        GetServerVariable('[SE_APOLLYON]Time'),      -- SE Apollyon
        GetServerVariable('[NE_APOLLYON]Time'),      -- NE Apollyon
        GetServerVariable('[CENTRAL_APOLLYON]Time'), -- Central Apollyon
        GetServerVariable('[CS_Apollyon]Time')       -- CS Apollyon
    )
end

return entity
