-----------------------------------
-- Area: Promyvion-Dem
--   NM: Memory Receptacle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    invaderXim.promyvion.receptacleOnMobInitialize(mob)
end

entity.onMobSpawn = function(mob)
    invaderXim.promyvion.receptacleOnMobSpawn(mob)
end

entity.onMobRoam = function(mob)
    invaderXim.promyvion.receptacleOnMobRoam(mob)
end

entity.onMobEngage = function(mob, target)
    invaderXim.promyvion.receptacleOnMobEngage(mob)
end

entity.onMobFight = function(mob, target)
    invaderXim.promyvion.receptacleOnMobFight(mob, target)
end

entity.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.promyvion.receptacleOnMobWeaponSkill(mob)
end

entity.onMobDespawn = function(mob)
    invaderXim.promyvion.receptacleOnMobDespawn(mob)
end

return entity
