-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Chigoe
--  Reactionary Rampart Pet
-----------------------------------
-----------------------------------

---@type TMobEntity
local entity = {}

-- mob takes double dmg
entity.onMobSpawn = function(mob)
    mob:hideName(false)
    mob:setUntargetable(false)
    mob:setMod(invaderXim.mod.UDMGMAGIC, 1000)
    mob:setMod(invaderXim.mod.UDMGPHYS, 100)
    mob:setMod(invaderXim.mod.UDMGRANGE, 100)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.DISEASE)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
