-----------------------------------
-- Area: Ceizak Battlegrounds
-- NPC: Root
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.reives.onMobSpawn(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.reives.onMobDeath(mob)
end

return entity
