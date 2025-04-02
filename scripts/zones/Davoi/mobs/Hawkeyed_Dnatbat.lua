-----------------------------------
-- Area: Davoi
--   NM: Hawkeyed Dnatbat
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 192)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 711 })
end

return entity
