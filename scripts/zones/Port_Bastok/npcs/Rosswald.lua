-----------------------------------
-- Area: Port Bastok
--  NPC: Rosswald
-- Zulkheim Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.ZULKHEIM) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.ROSSWALD_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.SLICE_OF_GIANT_SHEEP_MEAT,   49,
            invaderXim.item.PINCH_OF_DRIED_MARJORAM,     49,
            invaderXim.item.BAG_OF_SAN_DORIAN_FLOUR,     62,
            invaderXim.item.BAG_OF_RYE_FLOUR,            41,
            invaderXim.item.BAG_OF_SEMOLINA,           2080,
            invaderXim.item.LA_THEINE_CABBAGE,           24,
            invaderXim.item.JUG_OF_SELBINA_MILK,         62,
        }

        player:showText(npc, ID.text.ROSSWALD_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
