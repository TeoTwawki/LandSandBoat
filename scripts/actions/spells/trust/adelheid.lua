-----------------------------------
-- Trust: Adelheid
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    -- Records of Eminence: Alter Ego: Adelheid
    if caster:getEminenceProgress(936) then
        invaderXim.roe.onRecordTrigger(caster, 936)
    end

    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.SPAWN)

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.ADDENDUM_BLACK }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.DARK_ARTS })
    -- TODO: Restrict Addendum Black to Level 30+
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.ADDENDUM_BLACK }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.ADDENDUM_BLACK })

    mob:addGambit(ai.t.TARGET, { ai.c.READYING_WS, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_MS, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_JA, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })
    mob:addGambit(ai.t.TARGET, { ai.c.CASTING_MA, 0 }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.STUN })

    -- TODO: Choose Storms based on Mob Weakness before falling back to matching day
    mob:addGambit(ai.t.SELF, { ai.c.NO_STORM, 0 }, { ai.r.MA, ai.s.STORM_DAY, 0 }, 0)

    -- TODO: Choose Helix based on Mob Weakness before falling back to matching day
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.HELIX }, { ai.r.MA, ai.s.HELIX_DAY, 0 }, 0)

    mob:addGambit(ai.t.TANK, { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })
    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 33 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    -- TODO: Add Magic Burst Logic to Gambits to MB with Helix corresponding to SC
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.NONE }, 75)

    mob:addListener('WEAPONSKILL_USE', 'ADELHEID_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3469 then -- Twirling Dervish
        -- You may want to cover your ears!
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
