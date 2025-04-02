-----------------------------------
-- Trust: Semih Lafihna
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
        [invaderXim.magic.spell.STAR_SIBYL] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.AJIDO_MARUJIDO] = invaderXim.trust.messageOffset.TEAMWORK_2,
    })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.BARRAGE }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.BARRAGE })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.SHARPSHOT }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.SHARPSHOT })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.DOUBLE_SHOT }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.DOUBLE_SHOT })

    -- TODO: Stealth Shot not yet implemented
    -- mob:addGambit(ai.t.SELF, { ai.c.HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.STEALTH_SHOT })

    mob:addListener('WEAPONSKILL_USE', 'SEMIH_LAFIHNA_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3490 then -- Stellar Arrow
            -- I'll show you no quarter!
            invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    -- Ranged Attack as much as possible (limited by 'weapon' delay)
    mob:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.RATTACK, 0, 0 })

    mob:setAutoAttackEnabled(false)

    -- Gets 252 TP per hit even at level 1, see https://www.bg-wiki.com/ffxi/BGWiki:Trusts#Semih_Lafihna
    -- Using STP as a hack to ensure proper TP amount, as her delay is not that high on retail.
    mob:addMod(invaderXim.mod.STORETP, 86)

    mob:setMobMod(invaderXim.mobMod.TRUST_DISTANCE, invaderXim.trust.movementType.LONG_RANGE)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
