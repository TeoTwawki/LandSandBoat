-----------------------------------
-- Area: Metalworks
--  NPC: Nogga
-----------------------------------
local ID = zones[invaderXim.zone.METALWORKS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BOMB_ARM,                  780, 2,
        invaderXim.item.GRENADE,                  1252, 3,
        invaderXim.item.FLASQUE_OF_CATALYTIC_OIL,  104, 3,
        invaderXim.item.PINCH_OF_SOOT,             655, 1,
    }

    player:showText(npc, ID.text.NOGGA_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
