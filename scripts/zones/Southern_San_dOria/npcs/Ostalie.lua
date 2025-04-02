-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ostalie
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LEATHER_BELT,          442, 3,
        invaderXim.item.LIZARD_BELT,          2808, 3,
        invaderXim.item.SILVER_BELT,         11618, 1,
        invaderXim.item.CIRCLET,               166, 3,
        invaderXim.item.ROBE,                  249, 3,
        invaderXim.item.CUFFS,                 137, 3,
        invaderXim.item.SLOPS,                 199, 3,
        invaderXim.item.FLASK_OF_EYE_DROPS,   2698, 3,
        invaderXim.item.ANTIDOTE,              328, 3,
        invaderXim.item.FLASK_OF_ECHO_DROPS,   832, 2,
        invaderXim.item.POTION,                946, 1,
        invaderXim.item.ETHER,                5025, 1,
        invaderXim.item.PICKAXE,               208, 3,
        invaderXim.item.HATCHET,               520, 3,
    }

    local rank = GetNationRank(invaderXim.nation.SANDORIA)

    -- TODO: Check
    if rank ~= 1 then
        table.insert(stock, 1022)    -- Thief's Tools
        table.insert(stock, 3643)
        table.insert(stock, 3)
    elseif rank == 3 then
        table.insert(stock, 1023)    -- Living Key
        table.insert(stock, 5520)
        table.insert(stock, 3)
    end

    player:showText(npc, ID.text.OSTALIE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
