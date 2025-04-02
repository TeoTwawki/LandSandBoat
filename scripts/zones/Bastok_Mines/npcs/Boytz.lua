-----------------------------------
-- Area: Bastok Mines
--  NPC: Boytz
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRASS_FLOWERPOT,      1040, 3,
        invaderXim.item.PICKAXE,               208, 3,
        invaderXim.item.FLASK_OF_EYE_DROPS,   2698, 3,
        invaderXim.item.ANTIDOTE,              328, 3,
        invaderXim.item.FLASK_OF_ECHO_DROPS,   832, 2,
        invaderXim.item.POTION,                946, 2,
        invaderXim.item.ETHER,                5025, 1,
        invaderXim.item.WOODEN_ARROW,            4, 2,
        invaderXim.item.IRON_ARROW,              8, 3,
        invaderXim.item.CROSSBOW_BOLT,           6, 3,
        invaderXim.item.REPUBLIC_WAYSTONE,   10400, 3,
    }

    local rank = GetNationRank(invaderXim.nation.BASTOK)

    if rank >= 2 then
        table.insert(stock, invaderXim.item.SET_OF_THIEFS_TOOLS)
        table.insert(stock, 3643)
        table.insert(stock, 3)
    end

    if rank >= 3 then
        table.insert(stock, invaderXim.item.LIVING_KEY)
        table.insert(stock, 5520)
        table.insert(stock, 3)
    end

    player:showText(npc, ID.text.BOYTZ_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
