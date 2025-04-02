-----------------------------------
-- Trust: Naji
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    local bastokFirstTrust = caster:getCharVar('Quest[1][92]Prog')
    local zone = caster:getZoneID()

    if
        bastokFirstTrust == 1 and
        (zone == invaderXim.zone.NORTH_GUSTABERG or zone == invaderXim.zone.SOUTH_GUSTABERG)
    then
        caster:setCharVar('Quest[1][92]Prog', 2)
    end

    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.AYAME] = invaderXim.trust.messageOffset.TEAMWORK_1,
    })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_HAS_TOP_ENMITY, 0 }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.PROVOKE })
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
