-----------------------------------
-- Area: Port San d'Oria
--  NPC: Croumangue
-----------------------------------
local ID = zones[invaderXim.zone.PORT_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LOAF_OF_BLACK_BREAD,       124, 3,
        invaderXim.item.LOAF_OF_WHITE_BREAD,       208, 2,
        invaderXim.item.BOWL_OF_PEBBLE_SOUP,       208, 3,
        invaderXim.item.BOWL_OF_VEGETABLE_SOUP,   1566, 2,
        invaderXim.item.BOWL_OF_MUSHROOM_SOUP,    7280, 1,
        invaderXim.item.FLASK_OF_DISTILLED_WATER,   12, 3,
        invaderXim.item.BOTTLE_OF_APPLE_JUICE,     312, 2,
        invaderXim.item.BOTTLE_OF_GRAPE_JUICE,     967, 1,
        invaderXim.item.BOILED_CRAYFISH,           416, 3,
        invaderXim.item.ROAST_CARP,                540, 2,
        invaderXim.item.ROAST_TROUT,               624, 1,
    }

    player:showText(npc, ID.text.CROUMANGUE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
