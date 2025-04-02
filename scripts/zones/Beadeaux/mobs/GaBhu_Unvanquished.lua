-----------------------------------
-- Area: Beadeaux (254)
--   NM: Ga'Bhu Unvanquished
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 243)
end

return entity
