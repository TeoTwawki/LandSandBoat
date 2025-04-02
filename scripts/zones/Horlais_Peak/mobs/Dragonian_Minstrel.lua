-----------------------------------
-- Area: Horlais Peak
--  Mob: Dragonian Minstrel
-- KSNM30
-- TODO: Chaos Blade effect gets stronger after they use their respective 2-hour.
--       50% HP/MP reduction pre-2 hour and 75% HP/MP reduction post-2 hour.
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = invaderXim.jsa.SOUL_VOICE,
                endCode = function(mobArg)
                    mobArg:addMod(invaderXim.mod.ATT, 200)
                end,
            },
        },
    })
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
