-----------------------------------
-- Area: Port San d'Oria
--  NPC: Coullave
-----------------------------------
local ID = zones[invaderXim.zone.PORT_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LEATHER_RING,        1300, 3,
        invaderXim.item.SILVER_EARRING,      1300, 2,
        invaderXim.item.HACHIMAKI,            858, 2,
        invaderXim.item.KENPOGI,             1294, 2,
        invaderXim.item.TEKKO,                712, 2,
        invaderXim.item.SITABAKI,            1034, 2,
        invaderXim.item.KYAHAN,               660, 2,
        invaderXim.item.BAMBOO_STICK,         149, 2,
        invaderXim.item.FLASK_OF_EYE_DROPS,  2698, 3,
        invaderXim.item.ANTIDOTE,             328, 3,
        invaderXim.item.FLASK_OF_ECHO_DROPS,  832, 2,
        invaderXim.item.POTION,               946, 1,
        invaderXim.item.ETHER,               5025, 1,
        invaderXim.item.GRENADE,             1252, 1,
    }

    player:showText(npc, ID.text.COULLAVE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
