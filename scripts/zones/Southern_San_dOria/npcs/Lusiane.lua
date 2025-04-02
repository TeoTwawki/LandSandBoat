-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Lusiane
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LUGWORM,                        12, 2,
        invaderXim.item.LITTLE_WORM,                     4, 3,
        invaderXim.item.BAMBOO_FISHING_ROD,            561, 1,
        invaderXim.item.YEW_FISHING_ROD,               245, 2,
        invaderXim.item.WILLOW_FISHING_ROD,             74, 3,
        invaderXim.item.SCROLL_OF_LIGHT_THRENODY,      124, 3,
        invaderXim.item.SCROLL_OF_LIGHTNING_THRENODY, 1431, 3,
    }

    player:showText(npc, ID.text.LUSIANE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
