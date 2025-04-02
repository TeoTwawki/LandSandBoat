-----------------------------------
-- Area: Beadeaux (254)
--   NM: Ge'Dha Evileye
-- !pos -238 1 -202 254
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 240)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 283 })
end

return entity
