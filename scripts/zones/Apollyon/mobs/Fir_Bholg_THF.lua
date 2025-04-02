-----------------------------------
-- Area: Apollyon SW
--  NPC: Fir Bholg (THF)
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.PERFECT_DODGE, hpp = math.random(50, 60) },
        },
    })
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
