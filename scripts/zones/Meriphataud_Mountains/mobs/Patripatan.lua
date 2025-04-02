-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Patripatan
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 10) -- "Noted Double Attack"
    mob:addMod(invaderXim.mod.REGAIN, 50) -- "fairly potent Regain effect"
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PARALYZE)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 269)
    invaderXim.regime.checkRegime(player, mob, 63, 1, invaderXim.regime.type.FIELDS)
end

return entity
