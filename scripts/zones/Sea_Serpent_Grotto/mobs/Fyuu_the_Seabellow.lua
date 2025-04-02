-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Fyuu the Seabellow
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 372)
end

return entity
