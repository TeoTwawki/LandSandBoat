-----------------------------------
-- Area: Promyvion-Vahzl
--   NM: Deviator
-----------------------------------
mixins = { require('scripts/mixins/families/empty_terroanima') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.SILENCE)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
