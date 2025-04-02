-----------------------------------
-- Area: Bastok Mines
--  NPC: Neigepance
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BUNCH_OF_GYSAHL_GREENS,       70, 3,
        invaderXim.item.CHOCOBO_FEATHER,               8, 3,
        invaderXim.item.DART,                         10, 1,
        invaderXim.item.BLACK_CHOCOBO_FEATHER,      1300, 1,
        invaderXim.item.PET_FOOD_ALPHA_BISCUIT,       12, 3,
        invaderXim.item.PET_FOOD_BETA_BISCUIT,        93, 3,
        invaderXim.item.JUG_OF_CARROT_BROTH,          62, 3,
        invaderXim.item.JUG_OF_BUG_BROTH,            101, 3,
        invaderXim.item.JUG_OF_HERBAL_BROTH,         112, 3,
        invaderXim.item.JUG_OF_CARRION_BROTH,        313, 3,
        invaderXim.item.SCROLL_OF_CHOCOBO_MAZURKA, 57408, 3,
    }

    player:showText(npc, ID.text.NEIGEPANCE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
