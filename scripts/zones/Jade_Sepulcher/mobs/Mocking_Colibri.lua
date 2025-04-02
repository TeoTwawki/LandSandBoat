-----------------------------------
-- Area: Jade Sepulcher
--   NM: Mocking Colibri
-----------------------------------
mixins = { require('scripts/mixins/families/colibri_mimic') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
end

entity.onMobDisengage = function(mob)
    -- Remove dots when the mob disengages such as when charming everyone
    mob:delStatusEffect(invaderXim.effect.POISON)
    mob:delStatusEffect(invaderXim.effect.BURN)
    mob:delStatusEffect(invaderXim.effect.FROST)
    mob:delStatusEffect(invaderXim.effect.CHOKE)
    mob:delStatusEffect(invaderXim.effect.RASP)
    mob:delStatusEffect(invaderXim.effect.SHOCK)
    mob:delStatusEffect(invaderXim.effect.DROWN)
    mob:delStatusEffect(invaderXim.effect.DIA)
    mob:delStatusEffect(invaderXim.effect.BIO)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
