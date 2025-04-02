-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Titanis Xax
-- KSNM: Prehistoric Pigeons
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.SOUL_VOICE, cooldown = 200, hpp = 95 },
        },
    })
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
