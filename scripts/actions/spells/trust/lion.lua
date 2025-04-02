-----------------------------------
-- Trust: Lion
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.LION_II)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    -- TODO: Trust Synergy (Aldo/Lion/Zeid)
    -- https://www.bg-wiki.com/ffxi/Cipher:_Lion

    local kGrapeshot = 3198

    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.ZEID] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.ALDO] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.GILGAMESH] = invaderXim.trust.messageOffset.TEAMWORK_3,
    })

    -- Stun all the things!
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_WS, 0 }, { ai.r.WS, ai.s.SPECIFIC, kGrapeshot })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_MS, 0 }, { ai.r.WS, ai.s.SPECIFIC, kGrapeshot })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_JA, 0 }, { ai.r.WS, ai.s.SPECIFIC, kGrapeshot })
    mob:addGambit(ai.t.TARGET, { ai.c.CASTING_MA,  0 }, { ai.r.WS, ai.s.SPECIFIC, kGrapeshot })

    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
