-----------------------------------
-- Area: Port Bastok
--  NPC: Melloa
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -161.608, y = -7.480, z = -0.832 },
    { x = -161.454, z = -0.954, wait = 2000 },
    { x = -161.449, z = -0.919, wait = 5000 },
    { x = -161.454, z = -0.954 },
    { x = -161.716, z = -0.927 },
    { x = -162.779, z = -0.820 },
    { x = -163.727, z = -0.455 },
    { x = -168.236, z = 4.670, wait = 2000 },
    { x = -168.211, z = 4.695, wait = 5000 },
    { x = -163.727, z = -0.455 },
    { x = -162.779, z = -0.820 },
    { x = -161.716, z = -0.927 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(invaderXim.path.first(pathNodes))
    npc:pathThrough(pathNodes, invaderXim.path.flag.PATROL)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LOAF_OF_IRON_BREAD,         104, 3,
        invaderXim.item.BRETZEL,                     24, 2,
        invaderXim.item.LOAF_OF_PUMPERNICKEL,       166, 1,
        invaderXim.item.BAKED_POPOTO,               332, 3,
        invaderXim.item.SAUSAGE,                    162, 2,
        invaderXim.item.BOWL_OF_PEBBLE_SOUP,        208, 3,
        invaderXim.item.BOWL_OF_EGG_SOUP,          3432, 1,
        invaderXim.item.FLASK_OF_DISTILLED_WATER,    12, 3,
        invaderXim.item.BOTTLE_OF_MELON_JUICE,     1144, 2,
        invaderXim.item.BOTTLE_OF_PINEAPPLE_JUICE,  416, 1,
        invaderXim.item.SLICE_OF_ROAST_MUTTON,      748, 2,
    }

    player:showText(npc, ID.text.MELLOA_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
