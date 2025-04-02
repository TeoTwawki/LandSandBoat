-----------------------------------
-- Area: Batallia Downs (105)
--  Mob: Sobbing Sapling
--  Spawned by Weeping Willow
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 600)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
