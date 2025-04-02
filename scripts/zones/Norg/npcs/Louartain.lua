-----------------------------------
-- Area: Norg
--  NPC: Louartain
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = 41.878349, y = -6.282223, z = 10.820915 },
    { x = 42.088036, z = 11.867051 },
    { x = 42.096603, z = 12.939011 },
    { x = 42.104187, z = 17.270992 },
    { x = 42.126625, z = 14.951096 },
    { x = 42.097260, z = 10.187170 },
    { x = 42.104218, z = 17.303179 },
    { x = 42.128235, z = 14.767291 },
    { x = 42.097534, z = 10.223410 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(invaderXim.path.first(pathNodes))
    npc:pathThrough(pathNodes, invaderXim.path.flag.PATROL)
end

return entity
