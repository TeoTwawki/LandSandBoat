-----------------------------------
-- Area: Inner Horutoto Ruins
--   NM: Slendlix Spindlethumb
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 289)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 430 })
end

return entity
