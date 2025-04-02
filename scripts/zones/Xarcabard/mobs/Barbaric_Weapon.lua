-----------------------------------
-- Area: Xarcabard
--   NM: Barbaric Weapon
--  WOTG Nov 2009 NM: Immune to Bind, Sleep, Gravity. Uses only 1 TP move.
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:setMod(invaderXim.mod.STORETP, 80)
end

entity.onMobWeaponSkill = function(target, mob, skill)
    -- Gains Dread Spikes effect when using Whirl of Rage TP move
    if skill:getID() == 514 then
        mob:addStatusEffectEx(invaderXim.effect.DREAD_SPIKES, 0, 10, 0, 180, 0, 310, 1, 0, true)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 318)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
end

return entity
