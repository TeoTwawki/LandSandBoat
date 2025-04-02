-----------------------------------
-- Area: Wajaom Woodlands
--   NM: Chelicerata
-----------------------------------
mixins = { require('scripts/mixins/families/chigoe_nm') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.SLOW, { chance = 10 })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 449)
end

return entity
