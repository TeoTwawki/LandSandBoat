-----------------------------------
-- Area: Windurst Walls
--  NPC: Pakeke
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -118.747, y = -5.000, z = 145.220, rotation = 128, wait = 20000 },
    { rotation = 0, wait = 20000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(invaderXim.path.first(pathNodes))
    npc:pathThrough(pathNodes, invaderXim.path.flag.PATROL)
end

return entity
