-----------------------------------
-- Area: Windurst Walls
--  NPC: Malmi-Monmi
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -101.174, y = -5.450, z = 148.387, wait = 6000 },
    { x = -103.634, y = -5.478, z = 146.359, wait = 6000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(invaderXim.path.first(pathNodes))
    npc:pathThrough(pathNodes, invaderXim.path.flag.PATROL)
end

return entity
