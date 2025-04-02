-----------------------------------
-- Spell: IceSpirit
-- Summons IceSpirit to fight by your side
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    local result = 0
    if caster:hasPet() then
        result = invaderXim.msg.basic.ALREADY_HAS_A_PET
    elseif not caster:canUseMisc(invaderXim.zoneMisc.PET) then
        result = invaderXim.msg.basic.CANT_BE_USED_IN_AREA
    elseif caster:getObjType() == invaderXim.objType.PC then
        result = invaderXim.summon.avatarMiniFightCheck(caster)
    end

    return result
end

spellObject.onSpellCast = function(caster, target, spell)
    invaderXim.pet.spawnPet(caster, invaderXim.petId.ICE_SPIRIT)
    return 0
end

return spellObject
