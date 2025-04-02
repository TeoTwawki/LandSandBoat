-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Bo'Who Warmonger
-----------------------------------
mixins = { require('scripts/mixins/job_special'), require('scripts/mixins/rotz_bodyguarded_nm') }
-----------------------------------
---@type TMobEntity
local entity = {}

-- all body guard functionality in the rotz_bodyguarded_nm mixin

entity.onMobSpawn = function(mob)
    -- retail captures show these mods are not dependent on region control
    mob:setMod(invaderXim.mod.UDMGPHYS, -5000)
    mob:setMod(invaderXim.mod.UDMGRANGE, -5000)
    mob:setMod(invaderXim.mod.UDMGBREATH, -5000)
    mob:setMod(invaderXim.mod.UDMGMAGIC, -5000)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 60, 1, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(75600 + math.random(600, 900)) -- 21 hours, plus 10 to 15 min
end

return entity
