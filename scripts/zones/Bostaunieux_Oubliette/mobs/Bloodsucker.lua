-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Bloodsucker
-- Note: This script will be loaded for both the NM and non-NM mobs of this name.
-- !pos -21.776 16.983 -231.477 167
-----------------------------------
local ID = zones[invaderXim.zone.BOSTAUNIEUX_OUBLIETTE]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    if mob:getID() == ID.mob.BLOODSUCKER then
        mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1) -- "Has an Additional Effect of Drain on normal attacks"
        mob:setMobMod(invaderXim.mobMod.GIL_MIN, 3000)
        mob:setMobMod(invaderXim.mobMod.GIL_MAX, 9900)
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.HP_DRAIN)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 613, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    if mob:getID() == ID.mob.BLOODSUCKER then
        UpdateNMSpawnPoint(ID.mob.BLOODSUCKER)
        mob:setRespawnTime(3600)
    end
end

return entity
