-----------------------------------
-- Trust: Abquhbah
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
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.SPAWN)
    mob:addGambit(ai.t.SELF, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.BERSERK })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.WARCRY })
    mob:addGambit(ai.t.SELF, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.RESTRAINT })

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.RANDOM, 1500)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
