-----------------------------------
-- ID: 4163
-- Item: Panacea
-- Item Effect: Removes any number of status effects
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:delStatusEffect(invaderXim.effect.PARALYSIS)
    target:delStatusEffect(invaderXim.effect.BIND)
    target:delStatusEffect(invaderXim.effect.WEIGHT)
    target:delStatusEffect(invaderXim.effect.ADDLE)
    target:delStatusEffect(invaderXim.effect.BURN)
    target:delStatusEffect(invaderXim.effect.FROST)
    target:delStatusEffect(invaderXim.effect.CHOKE)
    target:delStatusEffect(invaderXim.effect.RASP)
    target:delStatusEffect(invaderXim.effect.SHOCK)
    target:delStatusEffect(invaderXim.effect.DROWN)
    target:delStatusEffect(invaderXim.effect.DIA)
    target:delStatusEffect(invaderXim.effect.BIO)
    target:delStatusEffect(invaderXim.effect.STR_DOWN)
    target:delStatusEffect(invaderXim.effect.DEX_DOWN)
    target:delStatusEffect(invaderXim.effect.VIT_DOWN)
    target:delStatusEffect(invaderXim.effect.AGI_DOWN)
    target:delStatusEffect(invaderXim.effect.INT_DOWN)
    target:delStatusEffect(invaderXim.effect.MND_DOWN)
    target:delStatusEffect(invaderXim.effect.CHR_DOWN)
    target:delStatusEffect(invaderXim.effect.MAX_HP_DOWN)
    target:delStatusEffect(invaderXim.effect.MAX_MP_DOWN)
    target:delStatusEffect(invaderXim.effect.ATTACK_DOWN)
    target:delStatusEffect(invaderXim.effect.EVASION_DOWN)
    target:delStatusEffect(invaderXim.effect.DEFENSE_DOWN)
    target:delStatusEffect(invaderXim.effect.MAGIC_DEF_DOWN)
    target:delStatusEffect(invaderXim.effect.INHIBIT_TP)
    target:delStatusEffect(invaderXim.effect.MAGIC_ACC_DOWN)
    target:delStatusEffect(invaderXim.effect.MAGIC_ATK_DOWN)
end

return itemObject
