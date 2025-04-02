-----------------------------------
-- Area: Bastok Mines
--  NPC: Griselda
-- !pos -25.749 -0.044 52.360 234
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LOAF_OF_IRON_BREAD,         104, 3,
        invaderXim.item.BRETZEL,                     24, 2,
        invaderXim.item.STRIP_OF_MEAT_JERKY,        124, 3,
        invaderXim.item.PICKLED_HERRING,            499, 2,
        invaderXim.item.FLASK_OF_DISTILLED_WATER,    12, 3,
        invaderXim.item.BOTTLE_OF_PINEAPPLE_JUICE,  416, 1,
        invaderXim.item.BOTTLE_OF_MELON_JUICE,     1144, 2,
    }

    player:showText(npc, ID.text.GRISELDA_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
