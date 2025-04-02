-----------------------------------
-- Area: Bastok Markets
--  NPC: Zhikkom
-- !pos -288.669 -10.319 -135.064 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_SWORD,    278, 3,
        invaderXim.item.IRON_SWORD,     8236, 2,
        invaderXim.item.MYTHRIL_SWORD, 35776, 1,
        invaderXim.item.BROADSWORD,    24344, 1,
        invaderXim.item.DEGEN,         10632, 3,
        invaderXim.item.TUCK,          13391, 1,
        invaderXim.item.SAPARA,          807, 3,
        invaderXim.item.SCIMITAR,       4706, 2,
        invaderXim.item.FALCHION,      70720, 1,
        invaderXim.item.XIPHOS,          698, 3,
        invaderXim.item.SPATHA,         1934, 3,
        invaderXim.item.BILBO,          3634, 3,
    }

    player:showText(npc, ID.text.ZHIKKOM_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
