-----------------------------------
-- Trust: Rahal
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
    -- Dragon Killer handled in mob_pool_mods
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.TRION] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.CURILLA] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.EXCENMILLE] = invaderXim.trust.messageOffset.TEAMWORK_3,
        [invaderXim.magic.spell.EXCENMILLE_S] = invaderXim.trust.messageOffset.TEAMWORK_4,
    })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.FLASH }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.FLASH })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.PROVOKE })
    mob:addGambit(ai.t.SELF, { ai.c.HPP_LT, 33 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.SENTINEL })
    mob:addGambit(ai.t.PARTY, { ai.l.OR(
                                { ai.c.STATUS, invaderXim.effect.SLEEP_I },
                                { ai.c.STATUS, invaderXim.effect.SLEEP_II },
                                { ai.c.STATUS, invaderXim.effect.LULLABY })
                                }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })
    mob:addGambit(ai.t.TARGET, { ai.l.OR(
                                { ai.c.CASTING_MA, 0 },
                                { ai.c.READYING_JA, 0 },
                                { ai.c.READYING_MS, 0 },
                                { ai.c.READYING_WS, 0 })
                            }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.SHIELD_BASH })
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 33 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.ENLIGHT }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.ENLIGHT })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.PHALANX }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PHALANX })
    mob:addGambit(ai.t.MASTER, { ai.c.NOT_STATUS, invaderXim.effect.BERSERK }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.BERSERK })

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 2500)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
