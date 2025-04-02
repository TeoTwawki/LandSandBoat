-----------------------------------
-- Area: Windurst Waters
--  NPC: Kyokyo
-- Nonstandard Moving NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -208.588, y = -3.000, z = -61.340, wait = 3000 },
    { x = -213.073, z = -58.185, wait = 3000 },
    { x = -211.882, z = -64.415, wait = 3000 },
    { x = -213.073, z = -58.185, wait = 3000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(invaderXim.path.first(pathNodes))
    npc:pathThrough(pathNodes, bit.bor(invaderXim.path.flag.PATROL, invaderXim.path.flag.RUN))
end

return entity
