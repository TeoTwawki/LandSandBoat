-----------------------------------
-- Area: Beadeaux (254)
--   NM: Zo'Khu Blackcloud
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 242)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 646 })
end

return entity
