-----------------------------------
-- Area: Dynamis - Valkurm
--  Mob: Serjeant Tombstone
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.dynamis.refillStatueOnSpawn(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.dynamis.refillStatueOnDeath(mob, player, optParams)
end

return entity
