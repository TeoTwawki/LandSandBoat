-----------------------------------
-- Trust: Nanaa Mihgo
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
        [invaderXim.magic.spell.ROMAA_MIHGO] = invaderXim.trust.messageOffset.TEAMWORK_1,
    })

    mob:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.DESPOIL })

    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.HIGHEST)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
