-----------------------------------
-- Area: Port Bastok
--  NPC: Galvin
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.FLASK_OF_EYE_DROPS,  2698, 3,
        invaderXim.item.ANTIDOTE,             328, 3,
        invaderXim.item.FLASK_OF_ECHO_DROPS,  832, 2,
        invaderXim.item.POTION,               946, 2,
        invaderXim.item.ETHER,               5025, 1,
        invaderXim.item.WOODEN_ARROW,           4, 2,
        invaderXim.item.IRON_ARROW,             8, 3,
        invaderXim.item.CROSSBOW_BOLT,          6, 3,
    }

    player:showText(npc, ID.text.GALVIN_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
