-----------------------------------
-- ID: 15838
-- Item: Coated Shield
-- Item Effect: Shell
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local power = 1055 -- Shell I   (27/256)
    local tier = 1
    local bonus = 0
    if target:getMod(invaderXim.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
        bonus = 39 -- (1/256 bonus buff per tier)
    end

    power = power + (bonus * tier)
    if target:addStatusEffect(invaderXim.effect.SHELL, power, 0, 1800, 0, 0, tier) then
        target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.SHELL)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
