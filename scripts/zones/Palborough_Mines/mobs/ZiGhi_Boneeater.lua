-----------------------------------
-- Area: Palborough Mines
--   NM: Zi'Ghi Boneeater
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 220)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 578 })
end

return entity
