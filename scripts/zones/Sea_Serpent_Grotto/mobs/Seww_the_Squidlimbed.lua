-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Seww the Squidlimbed
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 374)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 219, 647, 713, 944 })
end

return entity
