-----------------------------------
-- Area: Dynamis - Valkurm
--  Mob: Stcemqestcint
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:setMobSkillAttack(2012) -- use gouging_branch as its auto attack
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
