-----------------------------------
-- Area: Port Bastok
--  NPC: Numa
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.HACHIMAKI,                 858, 2,
        invaderXim.item.COTTON_HACHIMAKI,         5079, 1,
        invaderXim.item.KENPOGI,                  1294, 2,
        invaderXim.item.COTTON_DOGI,              7654, 1,
        invaderXim.item.TEKKO,                     712, 2,
        invaderXim.item.COTTON_TEKKO,             4212, 1,
        invaderXim.item.SITABAKI,                 1034, 2,
        invaderXim.item.COTTON_SITABAKI,          6133, 1,
        invaderXim.item.KYAHAN,                    660, 2,
        invaderXim.item.COTTON_KYAHAN,            3924, 1,
        invaderXim.item.SILVER_OBI,               3825, 1,
        invaderXim.item.BAMBOO_STICK,              149, 2,
        invaderXim.item.TOOLBAG_INOSHISHINOFUDA, 15600, 3,
        invaderXim.item.TOOLBAG_SHIKANOFUDA,     20800, 3,
        invaderXim.item.TOOLBAG_CHONOFUDA,       20800, 3,
        invaderXim.item.PICKAXE,                   208, 3,
    }

    player:showText(npc, ID.text.NUMA_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
