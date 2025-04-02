-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Plague Chigoe
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 75)
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, -50)
    mob:hideName(false)
    mob:setUntargetable(false)
end

entity.onAdditionalEffect = function(mob, target, damage)
    if math.random(100) <= 5 and not target:hasStatusEffect(invaderXim.effect.PLAGUE) then
        return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PLAGUE, { chance = 100 })
    else
        return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.MP_DRAIN, { power = target:getMaxMP() * 0.01, chance = 100 })
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
