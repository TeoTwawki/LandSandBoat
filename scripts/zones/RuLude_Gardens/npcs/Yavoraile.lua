-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Yavoraile
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = 27, y = 1.996, z = 70, rotation = 128, wait = 8000 },
    { x = 30, z = 67, rotation = 0, wait = 8000 },
    { z = 69, rotation = 0, wait = 8000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(invaderXim.path.first(pathNodes))
    npc:pathThrough(pathNodes, invaderXim.path.flag.PATROL)
end

return entity
