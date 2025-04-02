-----------------------------------
-- Area: VeLugannon Palace
--   NM: Brigandish Blade
-----------------------------------
local ID = zones[invaderXim.zone.VELUGANNON_PALACE]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 18227)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 18606)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.TERROR, { chance = 30 })
end

entity.onMobDeath = function(mob, player, optParams)
    GetNPCByID(ID.npc.QM3):setLocalVar('PillarCharged', 1)
end

return entity
