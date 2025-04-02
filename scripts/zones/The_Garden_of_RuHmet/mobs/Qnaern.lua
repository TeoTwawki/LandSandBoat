-----------------------------------
-- Area: The Garden of Ru'Hmet
--   NM: Qn'aern
-- Note: The RNG versions in Garden assist Ix'Aern (DRK)
--       All Qn'aerns can use their respective two-hour abilities multiple times (guessing 2-minute timers)
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    -- Resistances Confirmed
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.BIND)

    invaderXim.mix.jobSpecial.config(mob, {
        specials =
        {
            { id = invaderXim.jsa.EES_AERN, hpp = math.random(90, 95), cooldown = 120 }
        }
    })
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
