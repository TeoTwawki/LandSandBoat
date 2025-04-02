-----------------------------------
-- Area: Palborough Mines
--   NM: Be'Hya Hundredwall
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addStatusEffect(invaderXim.effect.STONESKIN, math.random(60, 70), 0, 300)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 222)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 941 })
end

return entity
