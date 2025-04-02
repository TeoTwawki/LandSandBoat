-----------------------------------
-- Area: Giddeus (145)
--   NM: Juu Duzu the Whirlwind
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 280)
end

return entity
