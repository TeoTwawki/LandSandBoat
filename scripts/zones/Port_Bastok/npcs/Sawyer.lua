-----------------------------------
-- Area: Port Bastok
--  NPC: Sawyer
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LOAF_OF_IRON_BREAD,         104, 3,
        invaderXim.item.BRETZEL,                     24, 2,
        invaderXim.item.LOAF_OF_PUMPERNICKEL,       166, 1,
        invaderXim.item.BAKED_POPOTO,               332, 3,
        invaderXim.item.SAUSAGE,                    162, 2,
        invaderXim.item.BOWL_OF_PEBBLE_SOUP,        208, 3,
        invaderXim.item.BOWL_OF_EGG_SOUP,          3432, 1,
        invaderXim.item.FLASK_OF_DISTILLED_WATER,    12, 3,
        invaderXim.item.BOTTLE_OF_MELON_JUICE,     1144, 2,
        invaderXim.item.BOTTLE_OF_PINEAPPLE_JUICE,  416, 1,
        invaderXim.item.SLICE_OF_ROAST_MUTTON,      748, 2,
    }

    player:showText(npc, ID.text.SAWYER_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
