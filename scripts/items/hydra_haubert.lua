-----------------------------------
-- ID: 14517
-- Item: Hydra Haubert
-- Item Effect: gives refresh
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.HYDRA_HAUBERT) then
        if target:hasStatusEffect(invaderXim.effect.REFRESH) then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            target:addStatusEffect(invaderXim.effect.REFRESH, 3, 3, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.HYDRA_HAUBERT)
        end
    end
end

return itemObject
