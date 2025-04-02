-----------------------------------
-- Spell: Cait Sith
-- Summons Cait Sith avatar
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    if not caster:canUseMisc(invaderXim.zoneMisc.PET) then
        return invaderXim.msg.basic.CANT_BE_USED_IN_AREA
    elseif caster:hasPet() then
        return invaderXim.msg.basic.ALREADY_HAS_A_PET
    elseif caster:getObjType() == invaderXim.objType.PC then
        return invaderXim.summon.avatarMiniFightCheck(caster)
    end

    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    invaderXim.pet.spawnPet(caster, invaderXim.petId.CAIT_SITH)

    local effect = caster:getStatusEffect(invaderXim.effect.AVATARS_FAVOR)
    if effect then
        effect:setPower(1) -- resummon resets effect
        invaderXim.avatarsFavor.applyAvatarsFavorAuraToPet(caster, effect)
        invaderXim.avatarsFavor.applyAvatarsFavorDebuffsToPet(caster)
    end

    return 0
end

return spellObject
