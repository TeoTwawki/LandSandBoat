-----------------------------------
-- Item Utils (Used by Skill Books)
-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
---@class invaderXim.itemUtils
invaderXim.itemUtils = {}

---@enum invaderXim.itemUtils.removableEffects
invaderXim.itemUtils.removableEffects =
{
    invaderXim.effect.PARALYSIS,
    invaderXim.effect.POISON,
    invaderXim.effect.BLINDNESS,
    invaderXim.effect.SILENCE,
    invaderXim.effect.DISEASE,
    invaderXim.effect.PETRIFICATION,
    invaderXim.effect.BIND,
    invaderXim.effect.WEIGHT,
    invaderXim.effect.ADDLE,
    invaderXim.effect.BURN,
    invaderXim.effect.FROST,
    invaderXim.effect.CHOKE,
    invaderXim.effect.RASP,
    invaderXim.effect.SHOCK,
    invaderXim.effect.DROWN,
    invaderXim.effect.DIA,
    invaderXim.effect.BIO,
    invaderXim.effect.STR_DOWN,
    invaderXim.effect.DEX_DOWN,
    invaderXim.effect.VIT_DOWN,
    invaderXim.effect.AGI_DOWN,
    invaderXim.effect.INT_DOWN,
    invaderXim.effect.MND_DOWN,
    invaderXim.effect.CHR_DOWN,
    invaderXim.effect.MAX_HP_DOWN,
    invaderXim.effect.MAX_MP_DOWN,
    invaderXim.effect.ATTACK_DOWN,
    invaderXim.effect.EVASION_DOWN,
    invaderXim.effect.DEFENSE_DOWN,
    invaderXim.effect.MAGIC_DEF_DOWN,
    invaderXim.effect.INHIBIT_TP,
    invaderXim.effect.MAGIC_ACC_DOWN,
    invaderXim.effect.MAGIC_ATK_DOWN
}

---@nodiscard
---@param target CBaseEntity
---@param foodType invaderXim.foodType
---@return integer
invaderXim.itemUtils.foodOnItemCheck = function(target, foodType)
    local result     = 0
    local targetRace = target:getRace()
    local canEatFish = targetRace == invaderXim.race.MITHRA or target:getMod(invaderXim.mod.EAT_RAW_FISH) == 1
    local canEatMeat = targetRace == invaderXim.race.GALKA or target:getMod(invaderXim.mod.EAT_RAW_MEAT) == 1

    if
        (foodType == invaderXim.foodType.RAW_FISH and not canEatFish) or
        (foodType == invaderXim.foodType.RAW_MEAT and not canEatMeat)
    then
        result = invaderXim.msg.basic.CANNOT_EAT
    end

    if target:hasStatusEffect(invaderXim.effect.FOOD) then
        result = invaderXim.msg.basic.IS_FULL
    end

    return result
end

---@nodiscard
---@param target CBaseEntity
---@return integer
invaderXim.itemUtils.itemBoxOnItemCheck = function(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = invaderXim.msg.basic.ITEM_NO_USE_INVENTORY
    end

    return result
end

---@nodiscard
---@param target CBaseEntity
---@param skillID integer
---@return integer
invaderXim.itemUtils.skillBookCheck = function(target, skillID)
    local skill   = skillID
    local mainCap = target:getMaxSkillLevel(target:getMainLvl(), target:getMainJob(), skill) or 0
    local subCap  = target:getMaxSkillLevel(target:getSubLvl(), target:getSubJob(), skill) or 0
    local mainDif = (mainCap * 10) / 10 - (target:getCharSkillLevel(skill) * 10) / 100
    local subDif  = (subCap * 10) / 10 - (target:getCharSkillLevel(skill) * 10) / 100
    local noSkill = 0

    if mainCap == 0 then
        noSkill = noSkill + 1
    end

    if subCap == 0 then
        noSkill = noSkill + 1
    end

    if noSkill >= 2 then
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    end

    if mainCap > 0 and mainDif <= 0 then
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    end

    if subCap > 0 and mainCap == 0 and subDif <= 0 then
        return invaderXim.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end

---@param target CBaseEntity
---@param skillID integer
---@return nil
invaderXim.itemUtils.skillBookUse = function(target, skillID)
    target:trySkillUp(skillID, target:getMainLvl(), true, true)
end

---@nodiscard
---@param target CBaseEntity
---@param itemgroup table
---@return integer
invaderXim.itemUtils.pickItemRandom = function(target, itemgroup) -- selects an item from a weighted result table
    -- possible results
    local items = itemgroup

    -- sum weights
    local sum = 0
    for i = 1, #items do
        sum = sum + items[i][1]
    end

    -- pick the weighted result
    local item = 0
    local pick = math.random(1, sum)
    sum = 0

    for i = 1, #items do
        sum = sum + items[i][1]
        if sum >= pick then
            item = items[i][2]
            break
        end
    end

    return item
end

invaderXim.itemUtils.removeShield = function(effect, target)
    if effect == invaderXim.effect.PHYSICAL_SHIELD then
        target:delStatusEffect(invaderXim.effect.MAGIC_SHIELD)
    else
        target:delStatusEffect(invaderXim.effect.PHYSICAL_SHIELD)
    end
end

invaderXim.itemUtils.addItemShield = function(target, power, duration, effect, special)
    if target:hasStatusEffect(effect) then
        local shield            = target:getStatusEffect(effect)
        local activeshieldpower = shield:getPower()

        if activeshieldpower > power then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            invaderXim.itemUtils.removeShield(effect, target)
            target:addStatusEffect(effect, power, 0, duration, 0, special)
            target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, effect)
        end
    else
        invaderXim.itemUtils.removeShield(effect, target)
        target:addStatusEffect(effect, power, 0, duration, 0, special)
        target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, effect)
    end
end

invaderXim.itemUtils.addItemEffect = function(target, effect, power, duration, subpower)
    if target:hasStatusEffect(effect) then
        local buff        = target:getStatusEffect(effect)
        local effectpower = buff:getPower()

        if effectpower > power then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            target:addStatusEffect(effect, power, 0, duration, 0, subpower)
        end
    else
        target:addStatusEffect(effect, power, 0, duration, 0, subpower)
    end
end

invaderXim.itemUtils.addTwoItemEffects = function(target, effect1, effect2, power1, power2, duration)
    if target:hasStatusEffect(effect1) then
        local buff        = target:getStatusEffect(effect1)
        local effectpower = buff:getPower()

        if effectpower > power1 then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            target:addStatusEffect(effect1, power1, 0, duration, 0, power1)
        end
    else
        target:addStatusEffect(effect1, power1, 0, duration, 0, power1)
    end

    if target:hasStatusEffect(effect2) then
        local buff        = target:getStatusEffect(effect2)
        local effectpower = buff:getPower()

        if effectpower > power2 then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            target:addStatusEffect(effect2, power2, 0, duration, 0, power2)
        end
    else
        target:addStatusEffect(effect2, power2, 0, duration, 0, power2)
    end
end

invaderXim.itemUtils.addItemExpEffect = function(target, effect, power, duration, subpower)
    local deleffect = invaderXim.effect.COMMITMENT

    if effect == deleffect then
        deleffect = invaderXim.effect.DEDICATION
    end

    if target:hasStatusEffect(effect) then
        local buff        = target:getStatusEffect(effect)
        local effectpower = buff:getPower()

        if effectpower > power then
            target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
        else
            target:delStatusEffectSilent(deleffect)
            target:addStatusEffect(effect, power, 0, duration, 0, subpower)
        end
    else
        target:delStatusEffectSilent(deleffect)
        target:addStatusEffect(effect, power, 0, duration, 0, subpower)
    end
end

invaderXim.itemUtils.removeStatus = function(target, effects)
    for _, effect in ipairs(effects) do
        if target:delStatusEffect(effect) then
            return true
        end
    end

    if target:eraseStatusEffect() ~= 255 then
        return true
    end

    return false
end

invaderXim.itemUtils.removeMultipleEffects = function(target, effects, count, random)
    local effectsToRemove = effects

    if random == 1 then -- randomize which effects get removed
        effectsToRemove = utils.shuffle(effects)
    end

    if count > 0 then
        local removed = 0

        for i = 0, count do
            if not invaderXim.itemUtils.removeStatus(target, effectsToRemove) then
                break
            end

            removed = removed + 1

            if removed >= count then
                break
            end
        end

        return removed
    end
end

-- for applying pet mods based on arbitrary conditions
-- I.E. avatar attack only for a particular pet
-- example usage in fervor_ring.lua
-- can pass nil for petId to apply to all pets
invaderXim.itemUtils.handlePetLatentMods = function(owner, petId, mods, give)
    local pet = owner:getPet()

    if
        pet and
        (not petId or pet:getPetID() == petId)
    then
        if give then
            for _, mod in ipairs(mods) do
                pet:addMod(mod[1], mod[2])
            end
        else
            for _, mod in ipairs(mods) do
                pet:delMod(mod[1], mod[2])
            end
        end
    end
end
