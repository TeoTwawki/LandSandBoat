-----------------------------------
-- ID: 5838
-- Item: tube_of_clear_salve_ii
-- Item Effect: Instantly removes all negative status effects from pet
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if not target:hasPet() then
        return invaderXim.msg.basic.REQUIRES_A_PET
    end

    return 0
end

itemObject.onItemUse = function(target)
    local pet = target:getPet()

    local effects =
    {
        invaderXim.effect.PETRIFICATION,
        invaderXim.effect.SILENCE,
        invaderXim.effect.BANE,
        invaderXim.effect.CURSE_II,
        invaderXim.effect.CURSE_I,
        invaderXim.effect.PARALYSIS,
        invaderXim.effect.PLAGUE,
        invaderXim.effect.POISON,
        invaderXim.effect.DISEASE,
        invaderXim.effect.BLINDNESS
    }

    local count = 10

    invaderXim.itemUtils.removeMultipleEffects(pet, effects, count)
end

return itemObject
