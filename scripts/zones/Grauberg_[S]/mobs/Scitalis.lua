-----------------------------------
-- Area: Grauberg [S]
--   NM: Scitalis
-- https://www.bg-wiki.com/ffxi/Scitalis
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.SLOW)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.PETRIFY)

    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 50)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- Captures show unresisted damage between 120 and 200. TODO find what causes full power AE to vary so greatly
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENAERO, { power = math.random(165, 190) })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 503)
end

return entity
