-----------------------------------
-- Area: Heaven's Tower
--  NPC: Chuqui-Chanqui
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -18.932, y = 0.500, z = -6.795 },
    { x = -21.262, z = 0.276, wait = 5000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(invaderXim.path.first(pathNodes))
    npc:pathThrough(pathNodes, invaderXim.path.flag.PATROL)
end

return entity
