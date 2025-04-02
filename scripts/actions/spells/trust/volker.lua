-----------------------------------
-- Trust: Volker
-- If there is a NIN, PLD, or RUN in the party, behaves as a damage dealer: Uses Aggressor, Berserk.
-- If there are no other tanks in the party, behaves as a tank: Uses Defender, Retaliation.
-- Uses Provoke in either role to maintain enmity as a tank or off-tank.
-- Uses weapon skills at 2000 TP with Warrior's Charge if it's available; does not try to skillchain. (TODO)
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
        [invaderXim.magic.spell.NAJI] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.CID] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.KLARA] = invaderXim.trust.messageOffset.TEAMWORK_3,
    })

    -- DD Mode
    mob:addGambit(ai.t.SELF, { ai.c.PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.BERSERK })
    mob:addGambit(ai.t.SELF, { ai.c.PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.AGGRESSOR })
    mob:addGambit(ai.t.TANK, { ai.c.HPP_LT, 50 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.PROVOKE })

    -- Tank Mode
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.PROVOKE })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.DEFENDER })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.RETALIATION })

    mob:addGambit(ai.t.MASTER, { ai.c.HPP_LT, 50 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.PROVOKE })

    -- TODO: Add Warriors Charge + WS Logic
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
