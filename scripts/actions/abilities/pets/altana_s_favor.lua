-----------------------------------
-- Altana's Favor
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    if not target:isPC() then
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
        return 0
    end

    summoner:setMP(0)

    if target:isDead() then
        target:sendRaise(4) -- arise
    elseif target:addStatusEffect(invaderXim.effect.RERAISE, 3, 0, 0) then -- Infinite duration http://wiki.ffo.jp/html/30976.html
        petskill:setMsg(invaderXim.msg.basic.JA_GAIN_EFFECT)
        return invaderXim.effect.RERAISE
    else
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
        return 0
    end
end

return abilityObject
