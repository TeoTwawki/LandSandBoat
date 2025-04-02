-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Pourette
-- Derfland Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.DERFLAND) ~= invaderXim.nation.SANDORIA then
        player:showText(npc, ID.text.POURETTE_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.BUNCH_OF_GYSAHL_GREENS,   70,
            invaderXim.item.GINGER_ROOT,             161,
            invaderXim.item.FLASK_OF_OLIVE_OIL,       16,
            invaderXim.item.WIJNRUIT,                124,
            invaderXim.item.DERFLAND_PEAR,           145,
            invaderXim.item.OLIVE_FLOWER,           1872,
        }

        player:showText(npc, ID.text.POURETTE_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
    end
end

return entity
