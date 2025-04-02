-----------------------------------
-- Area: Beadeaux (254)
--   NM: Bi'Gho Headtaker
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 239)
end

return entity
