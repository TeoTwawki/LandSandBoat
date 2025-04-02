-----------------------------------
-- Area: Middle Delkfutt's Tower
--   NM: Rhoitos
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 336)
end

return entity
