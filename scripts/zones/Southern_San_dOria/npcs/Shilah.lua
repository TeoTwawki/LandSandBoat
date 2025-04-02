-----------------------------------
-- Area: Southern San dOria
--  NPC: Shilah
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LOAF_OF_BLACK_BREAD,         124, 3,
        invaderXim.item.LOAF_OF_WHITE_BREAD,         208, 2,
        invaderXim.item.BOWL_OF_PULS,                624, 3,
        invaderXim.item.BOWL_OF_DELICIOUS_PULS,     1248, 2,
        invaderXim.item.PLATE_OF_MUSHROOM_RISOTTO,  5200, 1,
        invaderXim.item.BOWL_OF_PEBBLE_SOUP,         208, 3,
        invaderXim.item.BOWL_OF_VEGETABLE_SOUP,     1566, 2,
        invaderXim.item.BOWL_OF_MUSHROOM_SOUP,      7280, 1,
        invaderXim.item.SERVING_OF_BEAUGREEN_SAUTE, 1887, 2,
        invaderXim.item.FLASK_OF_DISTILLED_WATER,     12, 3,
        invaderXim.item.BOTTLE_OF_GRAPE_JUICE,       967, 2,
        invaderXim.item.POT_OF_SAN_DORIAN_TEA,      2882, 1,
        invaderXim.item.BUNCH_OF_ROYAL_GRAPES,      1456, 3,
    }

    player:showText(npc, ID.text.SHILAH_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
