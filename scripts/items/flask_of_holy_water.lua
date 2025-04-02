-----------------------------------
-- ID: 4154
-- Item: Flask of Holy Water
-- Item Effect: Removes curse
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local curse = target:getStatusEffect(invaderXim.effect.CURSE_I)
    local curse2 = target:getStatusEffect(invaderXim.effect.CURSE_II)
    local bane = target:getStatusEffect(invaderXim.effect.BANE)
    local power = 33 + target:getMod(invaderXim.mod.ENHANCES_HOLYWATER)

    if target:hasStatusEffect(invaderXim.effect.DOOM) and power > math.random(1, 100) then
        target:delStatusEffect(invaderXim.effect.DOOM)
        target:messageBasic(invaderXim.msg.basic.NARROWLY_ESCAPE)
    elseif curse ~= nil and curse2 ~= nil and bane ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_I)
        target:delStatusEffect(invaderXim.effect.CURSE_II)
        target:delStatusEffect(invaderXim.effect.BANE)
    elseif curse ~= nil and bane ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_I)
        target:delStatusEffect(invaderXim.effect.BANE)
    elseif curse2 ~= nil and bane ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_II)
        target:delStatusEffect(invaderXim.effect.BANE)
    elseif curse ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_I)
    elseif curse2 ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_II)
    elseif bane ~= nil then
        target:delStatusEffect(invaderXim.effect.BANE)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
