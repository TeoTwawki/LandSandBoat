-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Mouu the Waverider
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 380)
end

return entity
