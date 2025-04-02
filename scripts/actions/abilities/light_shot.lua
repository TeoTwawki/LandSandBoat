-----------------------------------
-- Ability: Light Shot
-- Consumes a Light Card to enhance light-based debuffs. Additional effect: Light-based Sleep
-- Dia Effect: Defense Down Effect +5% and DoT + 1
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    --ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
    --no card: <name> cannot perform that action.
    if
        player:getWeaponSkillType(invaderXim.slot.RANGED) ~= invaderXim.skill.MARKSMANSHIP or
        player:getWeaponSkillType(invaderXim.slot.AMMO) ~= invaderXim.skill.MARKSMANSHIP
    then
        return 216, 0
    end

    if
        player:hasItem(invaderXim.item.LIGHT_CARD, 0) or
        player:hasItem(invaderXim.item.TRUMP_CARD, 0)
    then
        return 0, 0
    else
        return 71, 0
    end
end

abilityObject.onUseAbility = function(player, target, ability, action)
    action:setRecast(math.max(0, action:getRecast() - player:getMod(invaderXim.mod.QUICK_DRAW_RECAST)))
    local duration = 60
    local bonusAcc = player:getStat(invaderXim.mod.AGI) / 2 + player:getMerit(invaderXim.merit.QUICK_DRAW_ACCURACY) + player:getMod(invaderXim.mod.QUICK_DRAW_MACC)
    local resist   = applyResistanceAbility(player, target, invaderXim.element.LIGHT, invaderXim.skill.NONE, bonusAcc)

    if resist < 0.5 then
        ability:setMsg(invaderXim.msg.basic.JA_MISS_2) -- resist message
        return invaderXim.effect.SLEEP_I
    end

    duration = duration * resist

    local effects = {}

    local dia = target:getStatusEffect(invaderXim.effect.DIA)

    if dia ~= nil then
        table.insert(effects, dia)
    end

    local threnody = target:getStatusEffect(invaderXim.effect.THRENODY)

    if threnody ~= nil and threnody:getSubPower() == invaderXim.mod.DARK_MEVA then
        table.insert(effects, threnody)
    end

    if #effects > 0 then
        local effect = effects[math.random(1, #effects)]
        -- TODO: duration here overwrites all previous values, this logic needs to be verified
        duration = effect:getDuration()
        local startTime = effect:getStartTime()
        local tick      = effect:getTick()
        local power     = effect:getPower()
        local subpower  = effect:getSubPower()
        local tier      = effect:getTier()
        local effectId  = effect:getEffectType()
        local subId     = effect:getSubType()
        power    = power * 1.5
        subpower = subpower * 1.5
        target:delStatusEffectSilent(effectId)
        target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier)

        local newEffect = target:getStatusEffect(effectId)
        if newEffect then
            newEffect:setStartTime(startTime)
        end
    end

    if target:addStatusEffect(invaderXim.effect.SLEEP_I, 1, 0, duration) then
        ability:setMsg(invaderXim.msg.basic.JA_ENFEEB_IS)
    else
        ability:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
    end

    local _ = player:delItem(invaderXim.item.LIGHT_CARD, 1) or player:delItem(invaderXim.item.TRUMP_CARD, 1)
    target:updateClaim(player)

    return invaderXim.effect.SLEEP_I
end

return abilityObject
