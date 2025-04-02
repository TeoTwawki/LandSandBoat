-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Tavourine
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_KNIFE,       170, 3,
        invaderXim.item.KNIFE,             2522, 3,
        invaderXim.item.BRONZE_ROD,         104, 3,
        invaderXim.item.BRASS_ROD,          717, 3,
        invaderXim.item.ROD,               2758, 1,
        invaderXim.item.BRONZE_MACE,        195, 3,
        invaderXim.item.MACE,              5041, 2,
        invaderXim.item.BRONZE_AXE,         328, 3,
        invaderXim.item.CLAYMORE,          2828, 3,
        invaderXim.item.MYTHRIL_CLAYMORE, 43680, 1,
        invaderXim.item.BRONZE_SPEAR,       915, 3,
        invaderXim.item.BRASS_SPEAR,       5408, 3,
        invaderXim.item.SPEAR,            18345, 3,
        invaderXim.item.LANCE,            19156, 3,
    }

    player:showText(npc, ID.text.TAVOURINE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
