-----------------------------------
-- Area: Rolanberry Fields [S]
--   NM: Delicieuse Delphine
-- https://www.bg-wiki.com/ffxi/Delicieuse_Delphine
-- Only uses Impale, and does it in threes
-- TODO allow deaggro based on distance (core CMobEntity::CanDeaggro() forces NM and Battlefield mobs to never stop chasing)
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 5)
    mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 50)
    mob:addMod(invaderXim.mod.MOVE_SPEED_STACKABLE, 18)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobWeaponSkillPrepare = function(mob, target)
    mob:setLocalVar('impaleCount', 2)

    return 316 -- Impale
end

entity.onMobWeaponSkill = function(target, mob, skill, action)
    if mob:getLocalVar('impaleCount') > 0 then
        mob:setLocalVar('impaleCount', mob:getLocalVar('impaleCount') - 1)
        mob:useMobAbility(skill:getID())
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PARALYZE, { chance = 50, duration = math.random(5, 30) })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 513)
end

return entity
