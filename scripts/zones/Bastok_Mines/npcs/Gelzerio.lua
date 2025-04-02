-----------------------------------
-- Area: Bastok Mines
--  NPC: Galzerio
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LUGWORM,              12, 3,
        invaderXim.item.LITTLE_WORM,           4, 2,
        invaderXim.item.BAMBOO_FISHING_ROD,  561, 1,
        invaderXim.item.YEW_FISHING_ROD,     245, 2,
        invaderXim.item.WILLOW_FISHING_ROD,   74, 3,
        invaderXim.item.ROBE,                249, 3,
        invaderXim.item.CUFFS,               137, 3,
        invaderXim.item.SLOPS,               199, 3,
        invaderXim.item.ASH_CLOGS,           128, 3,
        invaderXim.item.HEADGEAR,           2013, 3,
        invaderXim.item.DOUBLET,            2854, 3,
        invaderXim.item.GLOVES,             1575, 3,
        invaderXim.item.BRAIS,              2194, 3,
        invaderXim.item.GAITERS,            1466, 3,
    }

    player:showText(npc, ID.text.GELZERIO_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
