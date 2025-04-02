-----------------------------------
-- Trust: Excenmille
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell, invaderXim.magic.spell.EXCENMILLE_S)
end

spellObject.onSpellCast = function(caster, target, spell)
    local sandoriaFirstTrust = caster:getCharVar('SandoriaFirstTrust')
    local zone = caster:getZoneID()

    if
        sandoriaFirstTrust == 1 and
        (zone == invaderXim.zone.WEST_RONFAURE or zone == invaderXim.zone.EAST_RONFAURE)
    then
        caster:setCharVar('SandoriaFirstTrust', 2)
    end

    return invaderXim.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    invaderXim.trust.teamworkMessage(mob, {
        [invaderXim.magic.spell.RAHAL] = invaderXim.trust.messageOffset.TEAMWORK_1,
    })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, invaderXim.effect.SENTINEL }, { ai.r.JA, ai.s.SPECIFIC, invaderXim.ja.SENTINEL })

    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, invaderXim.effect.FLASH }, { ai.r.MA, ai.s.SPECIFIC, invaderXim.magic.spell.FLASH })

    mob:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 75 }, { ai.r.MA, ai.s.HIGHEST, invaderXim.magic.spellFamily.CURE })

    mob:addMod(invaderXim.mod.STORETP, 25)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
