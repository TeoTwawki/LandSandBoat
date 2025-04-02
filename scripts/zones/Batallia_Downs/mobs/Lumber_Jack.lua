-----------------------------------
-- Area: Batallia Downs (105)
--   NM: Lumber Jack
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(invaderXim.mod.UFASTCAST, 85)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 20)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 600)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 15000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 20000)
    mob:setMobMod(invaderXim.mobMod.MUG_GIL, 7500)
end

entity.onAdditionalEffect = function(mob, target, damage)
    if mob:hasStatusEffect(invaderXim.effect.ENSTONE) then
        return 0, 0, 0
    else
        return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.STUN)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    mob:setLocalVar('death', 1)
end

entity.onMobDespawn = function(mob)
    local lumberDeath = mob:getLocalVar('death')

    if lumberDeath then
        -- Lumber Jack died, Set Weeping Willow's respawn time (21-24 hours)
        GetMobByID(mob:getID() -6):setRespawnTime(math.random(75600, 86400))
    else
        -- Lumber Jack idle despawned, set Weeping Willow to 30 min respawn
        GetMobByID(mob:getID() -6):setRespawnTime(1800)
    end
end

return entity
