-----------------------------------
-- Area: Upper Delkfutt's Tower
--   NM: Mimas
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.HUNDRED_FISTS },
        },
    })
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
