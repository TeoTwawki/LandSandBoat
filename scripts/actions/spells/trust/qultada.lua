-----------------------------------
-- Trust: Qultada
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

    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.CORSAIRS_ROLL }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.CORSAIRS_ROLL })
    mob:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, invaderXim.effect.CHAOS_ROLL }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.CHAOS_ROLL })

    mob:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.RATTACK, 0, 0 }, 10)

    -- Notable: Uses a balance of melee and ranged attacks.
    -- TODO: Observe his WS behavior on retail
    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.RANDOM)

    -- https://forum.square-enix.com/ffxi/threads/49425-Dec-10-2015-%28JST%29-Version-Update?p=567979&viewfull=1#post567979
    -- Per the December 10, 2015 update:
    -- "The "Enhanced Magic Accuracy" attribute has been added."
    local power = mob:getMainLvl() / 5
    mob:addMod(invaderXim.mod.MACC, power)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
