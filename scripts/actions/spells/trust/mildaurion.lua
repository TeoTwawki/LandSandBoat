-----------------------------------
-- Trust: Mildaurion
-- https://ffxiclopedia.fandom.com/wiki/Trust:_Mildaurion
-- https://www.bg-wiki.com/ffxi/Cipher:_Mildaurion
-- From wikis:
-- "Tries to open skillchains when the player reaches 1500 TP. Does not try to open skillchains with other trusts."
-- "Will close skillchains with players and other trusts if possible, otherwise uses a weapon skill at 3000 TP."
-- TODO: We don't have a combination of OPENER and CLOSER for TP skill settings, so leaving as OPENER for now.
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
        [invaderXim.magic.spell.PRISHE] = invaderXim.trust.messageOffset.TEAMWORK_1,
        [invaderXim.magic.spell.ULMIA] = invaderXim.trust.messageOffset.TEAMWORK_2,
    })

    mob:addListener('WEAPONSKILL_USE', 'MILDAURION_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == invaderXim.mobSkill.LIGHT_BLADE_3 then
            --  For Vana'diel!
            invaderXim.trust.message(mobArg, invaderXim.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    mob:addMod(invaderXim.mod.MPP, 100)

    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.RANDOM)
end

spellObject.onMobDespawn = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
end

return spellObject
