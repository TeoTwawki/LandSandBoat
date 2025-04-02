-----------------------------------
-- Trust: Valaineral
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    -- Records of Eminence: Alter Ego: Valaineral
    if caster:getEminenceProgress(933) then
        invaderXim.roe.onRecordTrigger(caster, 933)
    end

    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    --[[
        Summon: With your courage and valor, Altana's children will live to see a brighter day.
        Summon (Formerly): Let the Royal Family’s blade be seared forever into their memories!
    ]]
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.SPAWN)

    mob:addGambit(ai.t.SELF, { ai.c.NOT_HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.PROVOKE })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.FLASH }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.FLASH })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.SENTINEL }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.SENTINEL })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
