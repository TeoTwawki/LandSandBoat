-----------------------------------
--  Gigaflare
--  Family: Bahamut
--  Description: Deals massive Fire damage to enemies within a fan-shaped area.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range:
--  Notes: Used by Bahamut when at 10% of its HP, and can use anytime afterwards at will.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local mobhp = mob:getHPP()

    if mobhp <= 10 then -- set up Gigaflare for being called by the script again.
        mob:setLocalVar('GigaFlare', 0)
        mob:setMobAbilityEnabled(false) -- disable mobskills/spells until Gigaflare is used successfully (don't want to delay it/queue Megaflare)
        mob:setMagicCastingEnabled(false)
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:setLocalVar('GigaFlare', 1) -- When set to 1 the script won't call it.
    mob:setLocalVar('tauntShown', 0)
    mob:setMobAbilityEnabled(true) -- enable the spells/other mobskills again
    mob:setMagicCastingEnabled(true)

    if bit.band(mob:getBehavior(), invaderXim.behavior.NO_TURN) == 0 then -- re-enable noturn
        mob:setBehavior(bit.bor(mob:getBehavior(), invaderXim.behavior.NO_TURN))
    end

    local damage = mob:getWeaponDmg() * 15

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.FIRE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE)

    return damage
end

return mobskillObject
