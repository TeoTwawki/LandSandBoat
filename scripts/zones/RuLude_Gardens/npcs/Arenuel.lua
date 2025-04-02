-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Arenuel
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = 36, y = 1.996, z = 63, rotation = 0, wait = 8000 },
    { z = 59, rotation = 0, wait = 8000 },
    { z = 71, rotation = 0, wait = 8000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(invaderXim.path.first(pathNodes))
    npc:pathThrough(pathNodes, invaderXim.path.flag.PATROL)
end

return entity
