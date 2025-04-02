-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Thadiene
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.SHORTBOW,                       45, 3,
        invaderXim.item.SELF_BOW,                      557, 2,
        invaderXim.item.WRAPPED_BOW,                  8236, 1,
        invaderXim.item.LONGBOW,                       511, 3,
        invaderXim.item.GREAT_BOW,                   22684, 1,
        invaderXim.item.WOODEN_ARROW,                    4, 3,
        invaderXim.item.IRON_ARROW,                      8, 2,
        invaderXim.item.SILVER_ARROW,                   18, 1,
        invaderXim.item.FIRE_ARROW,                    145, 2,
        invaderXim.item.CROSSBOW_BOLT,                   6, 2,
        invaderXim.item.BOOMERANG,                    1820, 1,
        invaderXim.item.SCROLL_OF_BATTLEFIELD_ELEGY,  4992, 3,
    }

    player:showText(npc, ID.text.ASH_THADI_ENE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
