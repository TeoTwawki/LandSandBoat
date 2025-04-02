-----------------------------------
-- Area: Temenos
--  Mob: Grognard Impaler
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.CALL_WYVERN, hpp = 100 },
        },
    })

    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
