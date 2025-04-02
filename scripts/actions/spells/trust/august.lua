-----------------------------------
-- Trust: August
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.ARCIELA]   = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.TEODOR]    = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.ROSULATIA] = invaderXim.trust.messageOffset.TEAMWORK_3,
        [invaderXim.magic.spell.MORIMAR]   = invaderXim.trust.messageOffset.TEAMWORK_4,
    })

    mob:setMobSkillAttack(1197)

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 2500)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
