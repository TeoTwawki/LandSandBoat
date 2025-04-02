-----------------------------------
-- Area: Apollyon SE, Floor 2
--  Mob: Tieholtsodi
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.HUNDRED_FISTS, hpp = 50 },
        },
    })
end

return entity
