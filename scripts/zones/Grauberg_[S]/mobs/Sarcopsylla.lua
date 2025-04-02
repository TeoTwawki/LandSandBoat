-----------------------------------
-- Area: Grauberg [S]
--   NM: Sarcopsylla
-- https://www.bg-wiki.com/ffxi/Sarcopsylla
-----------------------------------
mixins = { require('scripts/mixins/families/chigoe_nm') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    -- Set immunities.
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.PETRIFY)

    -- Set modifiers.
    mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 100)

    -- Set mob modifiers.
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENFIRE, { power = math.random(25, 30) })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 502)
end

return entity
