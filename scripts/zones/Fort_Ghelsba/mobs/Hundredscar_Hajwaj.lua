-----------------------------------
-- Area: Fort Ghelsba
--   NM: Hundredscar Hajwaj
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 172)
end

return entity
