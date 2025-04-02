-----------------------------------
-- Area: Pashhow Marshlands [S]
--   NM: Sugaar
-----------------------------------
mixins = { require('scripts/mixins/families/peiste') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.BLIND)
    mob:addImmunity(invaderXim.immunity.PETRIFY)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)

    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.SILENCE, { chance = 15, duration = 30 })
end

entity.onMobWeaponSkillPrepare = function(mob, target)
    -- seems overly complicated, but is reusable code for other mobs that use skills in a sequence
    local mobskillList =
    {
        2155, -- torpefying_charge
        2156, -- grim_glower
    }

    mob:setLocalVar('nextSkill', (mob:getLocalVar('nextSkill') + 1) % #mobskillList)
    local nextSkill = mob:getLocalVar('nextSkill') + 1
    return mobskillList[nextSkill]
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 508)
end

return entity
