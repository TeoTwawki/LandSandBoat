-----------------------------------
-- Area: Bastok Markets
--  NPC: Yafafa
-- Kolshushu Regional Goods
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.KOLSHUSHU) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.YAFAFA_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.BULB_OF_MHAURA_GARLIC,      83,
            invaderXim.item.YAGUDO_CHERRY,              45,
            invaderXim.item.SLICE_OF_DHALMEL_MEAT,     249,
            invaderXim.item.BUNCH_OF_BUBURIMU_GRAPES,  208,
            invaderXim.item.CASABLANCA,               1872,
        }

        player:showText(npc, ID.text.YAFAFA_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
