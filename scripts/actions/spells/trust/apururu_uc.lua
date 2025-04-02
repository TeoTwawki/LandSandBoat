-----------------------------------
-- Trust: Apururu UC
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

local isWearingApururuShirt = function(player)
    local wearingBody = player:getEquipID(invaderXim.slot.BODY) == invaderXim.item.APURURU_UNITY_SHIRT
    return wearingBody
end

spellObject.onMobSpawn = function(mob)
    local master = mob:getMaster()
    if isWearingApururuShirt(master) then
        invaderXim.trust.message(mob, invaderXim.trust.messageOffset.TEAMWORK_2)
    else
        invaderXim.trust.message(mob, invaderXim.trust.messageOffset.SPAWN)
    end

    -- Unity ranking high : invaderXim.trust.message(mob, invaderXim.trust.messageOffset.TEAMWORK_1)

    -- TODO: Nott weaponskill needs implemented and logic added here for Apururu to use at 50% MP at level 50.
    -- TODO: UC trusts are supposed to get bonuses depending on unity ranking. Needs research.
    -- TODO: Custom spawn messages if Unity ranking is higher.
    -- TODO: Setup conditional behaviors for Devotion, Martyr

    mob:addGambit(ai.t.SELF, { ai.c.MPP_LT, 25 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.CONVERT })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 25 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURAGA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SLEEP_II }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURAGA })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.PROTECT }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.PROTECTRA })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.SHELL }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.SHELLRA })

    mob:addGambit(ai.t.MELEE, { ai.c.NOT_STATUS, invaderXim.effect.HASTE }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.HASTE })

    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.POISON }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.POISONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PARALYSIS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.PARALYNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.BLINDNESS }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.BLINDNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.SILENCE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.SILENA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.PETRIFICATION }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STONA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.DISEASE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.VIRUNA })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS, invaderXim.effect.CURSE_I }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.CURSNA })

    mob:addGambit(ai.t.SELF, { ai.c.STATUS_FLAG, invaderXim.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })
    mob:addGambit(ai.t.PARTY, { ai.c.STATUS_FLAG, invaderXim.effectFlag.ERASABLE }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.ERASE })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.STONESKIN }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STONESKIN })

    -- BGwiki states 75/tick regain.  Only used for Nott WS.
    mob:addMod(invaderXim.mod.REGAIN, 75)

    mob:setAutoAttackEnabled(false)

    mob:setMobMod(invaderXim.mobMod.TRUST_DISTANCE, invaderXim.trust.movementType.MID_RANGE)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
