-----------------------------------
-- Area: Toraimarai Canal
--   NM: Magic Sludge
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    player:setCharVar('rootProblem', 3)
end

return entity
