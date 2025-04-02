-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Arlenne
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.ASH_CLUB,           74, 3,
        invaderXim.item.MAPLE_WAND,         54, 3,
        invaderXim.item.WILLOW_WAND,       384, 3,
        invaderXim.item.YEW_WAND,         1628, 1,
        invaderXim.item.ASH_STAFF,          66, 3,
        invaderXim.item.HOLLY_STAFF,       660, 3,
        invaderXim.item.ELM_STAFF,        3750, 1,
        invaderXim.item.ASH_POLE,          436, 3,
        invaderXim.item.HOLLY_POLE,       5279, 2,
        invaderXim.item.ELM_POLE,        18969, 1,
        invaderXim.item.CESTI,             149, 3,
        invaderXim.item.BRASS_KNUCKLES,    936, 3,
        invaderXim.item.BRASS_BAGHNAKHS,  1757, 3,
        invaderXim.item.BRONZE_ZAGHNAL,    357, 3,
        invaderXim.item.BRASS_ZAGHNAL,    2938, 3,
        invaderXim.item.ZAGHNAL,         13041, 1,
    }

    player:showText(npc, ID.text.ARLENNE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
