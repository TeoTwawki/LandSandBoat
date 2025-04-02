-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Victoire
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.FACEGUARD,              1508,
        invaderXim.item.HEADGEAR,               2013,
        invaderXim.item.SCALE_MAIL,             2319,
        invaderXim.item.DOUBLET,                2854,
        invaderXim.item.SCALE_FINGER_GAUNTLETS, 1237,
        invaderXim.item.GLOVES,                 1575,
        invaderXim.item.SCALE_CUISSES,          1861,
        invaderXim.item.BRAIS,                  2194,
        invaderXim.item.SCALE_GREAVES,          1128,
        invaderXim.item.GAITERS,                1466,
    }

    player:showText(npc, ID.text.CARAUTIA_SHOP_DIALOG)
    invaderXim.shop.general(player, stock)
end

return entity
