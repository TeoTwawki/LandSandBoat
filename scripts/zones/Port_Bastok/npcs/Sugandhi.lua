-----------------------------------
-- Area: Port Bastok
--  NPC: Sugandhi
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_KNIFE,    170, 3,
        invaderXim.item.KNIFE,          2522, 2,
        invaderXim.item.KUKRI,          6458, 1,
        invaderXim.item.CAT_BAGHNAKHS,   120, 3,
        invaderXim.item.BRONZE_SWORD,    278, 3,
        invaderXim.item.IRON_SWORD,     8236, 3,
        invaderXim.item.MYTHRIL_SWORD, 35776, 2,
        invaderXim.item.BROADSWORD,    24344, 1,
        invaderXim.item.DEGEN,         10632, 3,
        invaderXim.item.TUCK,          13391, 1,
        invaderXim.item.SAPARA,          807, 3,
        invaderXim.item.SCIMITAR,       4706, 2,
        invaderXim.item.FALCHION,      70720, 1,
    }

    player:showText(npc, ID.text.SUGANDHI_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
