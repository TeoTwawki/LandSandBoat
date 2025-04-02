-----------------------------------
-- Area: Temenos
--  Mob: Yagudo Eradicator
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
