-----------------------------------
-- Area: Aydeewa Subterrane
--  Mob: Fossorial Flea
-----------------------------------
mixins = { require('scripts/mixins/families/chigoe') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PLAGUE, { chance = 10 })
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
