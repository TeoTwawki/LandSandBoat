-----------------------------------
-- Trust: Areuhat
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

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.AGGRESSOR }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.AGGRESSOR })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.BERSERK }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.BERSERK })
    mob:addGambit(ai.t.PARTY, { ai.l.OR(
                        { ai.c.NOT_STATUS, invaderXim.effect.WARCRY },
                        { ai.c.NOT_STATUS, invaderXim.effect.BLOOD_RAGE })
                            }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.BLOOD_RAGE })

    mob:addListener('WEAPONSKILL_USE', 'AREUHAT_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3438 then -- Dragon Breath
        -- Perhaps I should just burn the eyes of these infidels with my true form.
            if math.random(1, 100) <= 33 then
                invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
            end
        end
    end)

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 2000)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
