-----------------------------------
-- Trust: Mumor
-----------------------------------
---@type TSpellTrust
local spellObject = {}

-- Define the main jobs with access to primary healing used to toggle Samba type
local healingJobs =
{
    invaderXim.job.WHM,
    invaderXim.job.RDM,
    invaderXim.job.SCH,
    invaderXim.job.PLD,
}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.MUMOR_II)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.UKA_TOTLIHN] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.ULLEGORE   ] = invaderXim.trust.messageOffset.TEAMWORK_2,
    })

    -- Dynamic modifier that checks party member list on tick to apply
    mob:addListener('COMBAT_TICK', 'MUMOR_CTICK', function(mobArg)
        local sambaDurationBoost = 0
        local party = mobArg:getMaster():getPartyWithTrusts()
        for _, member in pairs(party) do
            if member:getObjType() == invaderXim.objType.TRUST then
                if
                    member:getTrustID() == invaderXim.magic.spell.UKA_TOTLIHN
                then
                    sambaDurationBoost = 10
                end
            end
        end

        -- Always set the boost, even if Uka wasn't found.
        -- This accounts for her being in the party and giving the boost
        -- and also if she dies and the boost goes away.
        mobArg:setMod(invaderXim.mod.SAMBA_DURATION, sambaDurationBoost)
    end)

    -- Sets stance
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.SABER_DANCE }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.SABER_DANCE })

    -- Step usage: -DEF debuff and stuns
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.WEAKENED_DAZE_5 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.STUTTER_STEP })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_WS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.VIOLENT_FLOURISH })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_MS, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.VIOLENT_FLOURISH })
    mob:addGambit(ai.t.TARGET, { ai.c.READYING_JA, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.VIOLENT_FLOURISH })
    mob:addGambit(ai.t.TARGET, { ai.c.CASTING_MA, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.VIOLENT_FLOURISH })

    -- Samba logic
    -- Checks masters job, adjusts samba type if master has a healer main job.
    for i = 1, #healingJobs do
        local master  = mob:getMaster()
        if
            master and
            master:getMainJob() == healingJobs[i]
        then
            mob:addGambit(ai.t.SELF, { ai.c.NO_SAMBA, ai.r.JA }, { 0, ai.s.SPECIFIC, invaderXim.ja.HASTE_SAMBA })
        end
    end

    -- Adds ecosystem to adjust samba to haste if target is undead
    mob:addGambit(ai.t.TARGET, { ai.c.IS_ECOSYSTEM, invaderXim.ecosystem.UNDEAD }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.HASTE_SAMBA })
    -- Else picks highest drain spell available
    mob:addGambit(ai.t.SELF, { ai.c.NO_SAMBA, 0 }, { ai.r.JA, ai.s.BEST_SAMBA, invaderXim.ja.DRAIN_SAMBA })
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
