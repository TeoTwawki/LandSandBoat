-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Foreseer Oramix
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 399)
end

return entity
