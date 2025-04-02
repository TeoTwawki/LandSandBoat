-----------------------------------
-- Spell: Alexander
-- Summons Alexander to fight by your side
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    if not caster:canUseMisc(invaderXim.zoneMisc.PET) then
        return invaderXim.msg.basic.CANT_BE_USED_IN_AREA
    elseif not caster:hasStatusEffect(invaderXim.effect.ASTRAL_FLOW) then
        return 581
    elseif caster:hasPet() then
        return invaderXim.msg.basic.ALREADY_HAS_A_PET
    elseif caster:getObjType() == invaderXim.objType.PC then
        return invaderXim.summon.avatarMiniFightCheck(caster)
    end

    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    caster:spawnPet(invaderXim.petId.ODIN)
    caster:petAttack(target)

    return 0
end

return spellObject
