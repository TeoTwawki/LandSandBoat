-----------------------------------
-- Area: Windurst Woods
--  NPC: Taraihi-Perunhi
-- Only sells when Windurst controlls Derfland Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(invaderXim.region.DERFLAND)

    if regionOwner ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.TARAIHIPERUNHI_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.TARAIHIPERUNHI_OPEN_DIALOG)

        local stock =
        {
            4352,  128, -- Derfland Pear
            617,   142, -- Ginger
            4545,   62, -- Gysahl Greens
            1412, 1656, -- Olive Flower
            633,    14, -- Olive Oil
            951,   110  -- Wijnruit
        }
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
