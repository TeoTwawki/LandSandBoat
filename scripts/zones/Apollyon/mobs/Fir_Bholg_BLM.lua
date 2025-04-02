-----------------------------------
-- Area: Apollyon SW
--  NPC: Fir Bholg (BLM)
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.MANAFONT, hpp = math.random(50, 60) },
        },
    })
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
