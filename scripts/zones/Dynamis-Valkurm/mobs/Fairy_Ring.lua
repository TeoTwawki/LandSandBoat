-----------------------------------
-- Area: Dynamis - Valkurm
--  Mob: Fairy Ring
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setBaseSpeed(70)
    mob:setMobSkillAttack(2008) -- use mephitic spare as its auto attack
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:setMobMod(invaderXim.mobMod.WEAPON_BONUS, 165) -- Level 85 + 2 + 165 = 252 Base damage
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
