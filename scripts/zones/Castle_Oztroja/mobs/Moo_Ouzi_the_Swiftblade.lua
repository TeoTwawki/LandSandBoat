-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Moo Ouzi the Swiftblade
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 303)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 892 })
end

return entity
