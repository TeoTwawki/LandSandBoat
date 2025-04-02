-----------------------------------
-- Area: Davoi
--   NM: Poisonhand Gnadgad
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 195)
end

return entity
