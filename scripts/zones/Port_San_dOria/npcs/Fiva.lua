-----------------------------------
-- Area: Port San d'Oria
--  NPC: Fiva
-- Kolshushu Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.KOLSHUSHU) ~= invaderXim.nation.SANDORIA then
        player:showText(npc, ID.text.FIVA_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.BULB_OF_MHAURA_GARLIC,      83,
            invaderXim.item.YAGUDO_CHERRY,              45,
            invaderXim.item.SLICE_OF_DHALMEL_MEAT,     249,
            invaderXim.item.BUNCH_OF_BUBURIMU_GRAPES,  208,
            invaderXim.item.CASABLANCA,               1872,
        }

        player:showText(npc, ID.text.FIVA_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
    end
end

return entity
