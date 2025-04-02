-----------------------------------
-- Trust: Maat UC
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.MAAT)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.SPAWN)
    -- TODO test and incorporate (possesses increased kick attacks rate)
    mob:addGambit(ai.t.SELF, { ai.c.HPP_LT, 50 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.CHAKRA })
    mob:addGambit(ai.t.SELF, { ai.c.HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.COUNTERSTANCE })
    mob:addGambit(ai.t.SELF, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.IMPETUS })

    if mob:getMaster():getMainLvl() >= 50 then
        -- TODO no current implementation to have multiple criterias on setTrustTOSkillSetting to allow opening a skill chain and closing a skill chain
        mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 3000)
    end
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
