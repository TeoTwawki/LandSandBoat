-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Beryl-footed Molberry
-----------------------------------
mixins =
{
    require('scripts/mixins/families/tonberry'),
    require('scripts/mixins/job_special')
}
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobSpawn = function(mob)
    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.MIJIN_GAKURE, hpp = math.random(20, 30) },
        },
    })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 387)
end

return entity
