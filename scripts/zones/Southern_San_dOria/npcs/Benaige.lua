-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Benaige
-- !pos -142 -6 47 230
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.POT_OF_CRYING_MUSTARD,      29, 3,
        invaderXim.item.PINCH_OF_DRIED_MARJORAM,    49, 2,
        invaderXim.item.BAG_OF_RYE_FLOUR,           41, 3,
        invaderXim.item.BAG_OF_SAN_DORIAN_FLOUR,    62, 2,
        invaderXim.item.BAG_OF_SEMOLINA,          2080, 2,
        invaderXim.item.POT_OF_MAPLE_SUGAR,         41, 2,
        invaderXim.item.STICK_OF_CINNAMON,         270, 1,
        invaderXim.item.EAR_OF_MILLIONCORN,         49, 1,
        invaderXim.item.CHUNK_OF_ROCK_SALT,         16, 3,
        invaderXim.item.FLASK_OF_DISTILLED_WATER,   12, 3,
        invaderXim.item.SPRIG_OF_CIBOL,            228, 3,
        invaderXim.item.ZUCCHINI,                  511, 2,
        invaderXim.item.CLUSTER_OF_PAPRIKA,        590, 2,
    }

    player:showText(npc, ID.text.RAIMBROYS_SHOP_DIALOG + 1)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
