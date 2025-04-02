-----------------------------------
-- Area: Bastok Markets
--  NPC: Hortense
-- !pos -82.503 -4.849 -132.376 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.SCROLL_OF_FOE_REQUIEM,         74, 3,
        invaderXim.item.SCROLL_OF_FOE_REQUIEM_II,     509, 3,
        invaderXim.item.SCROLL_OF_FOE_REQUIEM_III,   4576, 3,
        invaderXim.item.SCROLL_OF_FOE_REQUIEM_IV,    7987, 3,
        invaderXim.item.SCROLL_OF_FOE_REQUIEM_VII,  53352, 3,
        invaderXim.item.SCROLL_OF_ARMYS_PAEON,         43, 3,
        invaderXim.item.SCROLL_OF_ARMYS_PAEON_II,     371, 3,
        invaderXim.item.SCROLL_OF_ARMYS_PAEON_III,   3744, 3,
        invaderXim.item.SCROLL_OF_ARMYS_PAEON_IV,    6864, 3,
        invaderXim.item.SCROLL_OF_ARMYS_PAEON_VI,   55328, 3,
        invaderXim.item.SCROLL_OF_VALOR_MINUET,        24, 3,
        invaderXim.item.SCROLL_OF_VALOR_MINUET_II,   1272, 3,
        invaderXim.item.SCROLL_OF_VALOR_MINUET_III,  6406, 3,
        invaderXim.item.SCROLL_OF_VALOR_MINUET_V,   60840, 3,
    }

    player:showText(npc, ID.text.HORTENSE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
