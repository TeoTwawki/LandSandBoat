-----------------------------------
-- Area: Dynamis - Valkurm
--  Mob: Cirrate Christelle
-- Note: Mega Boss
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobSkillAttack(2010)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:setMobMod(invaderXim.mobMod.WEAPON_BONUS, 50)
end

entity.onMobWeaponSkillPrepare = function(mob, target)
    -- TODO: Need to implement skill ID changes based on which NMs were killed. Needs more captures.
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.dynamis.megaBossOnDeath(mob, player, optParams)
end

return entity
