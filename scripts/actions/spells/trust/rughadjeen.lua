-----------------------------------
-- Trust: Rughadjeen
-- Possesses Fast Cast, Cure Potency Received +30%, Damage Taken -5%.
-- He wields the Algol and so has an enfire effect (TODO) and a 3% triple attack rate.
-- Uses Holy Circle if the enemy is Undead.
-- Will only cast Cure I - IV when a party member is below 75% (yellow) HP or asleep.
-- Tries to use weapon skills at 1000 TP, but it is lower priority.
-- Uses Chivalry at 50% MP if it's available.
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
        [invaderXim.magic.spell.NASHMEIRA] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.GADALAR] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.NAJELITH] = invaderXim.trust.messageOffset.TEAMWORK_3,
        [invaderXim.magic.spell.ZAZARG] = invaderXim.trust.messageOffset.TEAMWORK_4,
        [invaderXim.magic.spell.MIHLI_ALIAPOH] = invaderXim.trust.messageOffset.TEAMWORK_5
    })

    -- TODO: Load/Apply MODs from mob_pool_mods instead
    mob:addMod(invaderXim.mod.FASTCAST, 30)
    mob:addMod(invaderXim.mod.CURE_POTENCY_RCVD, 30)
    mob:addMod(invaderXim.mod.DMG, -500)
    mob:addMod(invaderXim.mod.TRIPLE_ATTACK, 3)
    -- TODO: Add en-fire effect from Algol

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.SENTINEL }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.SENTINEL })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.FLASH }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.FLASH })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.DIVINE_EMBLEM }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.DIVINE_EMBLEM })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.HOLY })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_II }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.TARGET, { ai.c.IS_ECOSYSTEM, invaderXim.ecosystem.UNDEAD }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.HOLY_CIRCLE })

    mob:addGambit(ai.t.SELF, { ai.c.MPP_LT, 50 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.CHIVALRY })

    -- TODO: Add Trust Synergy for Serpent Generals

    mob:addListener('WEAPONSKILL_USE', 'RUGHADJEEN_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3237 then -- Victory Beacon
        -- Do not despair! The Goddess of Victory fights by our side!
            if math.random(1, 100) <= 33 then
                invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
            end
        end
    end)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
