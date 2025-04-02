-----------------------------------
-- Area: Windurst Waters
--  NPC: Ahyeekih
-- Only sells when Windurst controls Kolshushu
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WATERS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(invaderXim.region.KOLSHUSHU)

    if regionOwner ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.AHYEEKIH_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.AHYEEKIH_OPEN_DIALOG)

        local stock =
        {
            4503,   184,  -- Buburimu Grape
            1120,  1620,  -- Casablanca
            4359,   220,  -- Dhalmel Meat
            614,     72,  -- Mhaura Garlic
            4445,    40   -- Yagudo Cherry
        }
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
