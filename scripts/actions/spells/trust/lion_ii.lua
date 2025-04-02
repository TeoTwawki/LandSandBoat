-----------------------------------
-- Trust: Lion II
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.LION)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.ZEID] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.PRISHE_II] = invaderXim.trust.messageOffset.TEAMWORK_2,
        [invaderXim.magic.spell.LILISETTE_II] = invaderXim.trust.messageOffset.TEAMWORK_4,
        [invaderXim.magic.spell.ARCIELA_II] = invaderXim.trust.messageOffset.TEAMWORK_5,
    })

    mob:addListener('WEAPONSKILL_USE', 'LION_II_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3493 then -- Powder Keg
            --  I won't sit by and let Vana'diel be engulged!
            invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.COPY_IMAGE }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.UTSUSEMI })

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.RANDOM, 3000)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
