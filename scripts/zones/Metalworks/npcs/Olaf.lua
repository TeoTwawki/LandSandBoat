-----------------------------------
-- Area: Metalworks
--  NPC: Olaf
-----------------------------------
local ID = zones[invaderXim.zone.METALWORKS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.ARQUEBUS,          54121, 2,
        invaderXim.item.BULLET,              104, 3,
        invaderXim.item.PINCH_OF_BOMB_ASH,   535, 3,
    }

    player:showText(npc, ID.text.OLAF_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
