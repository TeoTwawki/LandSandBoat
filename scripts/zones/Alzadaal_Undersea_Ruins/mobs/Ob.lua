-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  Mob: Ob
-----------------------------------
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}
-- Todo: Pups can make it change frames, Overload causes Rage

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
    mob:addImmunity(invaderXim.immunity.SILENCE)
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[rage]timer', 3600) -- 60 minutes
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
