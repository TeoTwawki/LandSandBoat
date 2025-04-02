-----------------------------------
-- ID: 5837
-- Item: tube_of_clear_salve_i
-- Item Effect: Instantly removes 1-2 negative status effects at random from pet
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

    local count = math.random(1, 2)
    local random = 1

    invaderXim.itemUtils.removeMultipleEffects(pet, effects, count, random)
end

return itemObject
