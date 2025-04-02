-----------------------------------
-- Puppetmaster Job Utilities
-----------------------------------
require('scripts/globals/ability')
require('scripts/globals/jobpoints')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.puppetmaster = invaderXim.job_utils.puppetmaster or {}
-----------------------------------

local removableEffectIds =
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
    invaderXim.effect.BLINDNESS,
}

-- https://www.bg-wiki.com/ffxi/Repair
local oilType =
{
--  ItemId                               { Base, %HP, Time(s) }
    [invaderXim.item.CAN_OF_AUTOMATON_OIL   ] = { 20, 0.1, 15 },
    [invaderXim.item.CAN_OF_AUTOMATON_OIL_P1] = { 40, 0.2, 30 },
    [invaderXim.item.CAN_OF_AUTOMATON_OIL_P2] = { 60, 0.3, 45 },
    [invaderXim.item.CAN_OF_AUTOMATON_OIL_P3] = { 80, 0.4, 60 },
}

-- Removes status effects based on the oil used.
local idStrengths =
{
    [invaderXim.item.CAN_OF_AUTOMATON_OIL   ] = 1, -- Automaton Oil
    [invaderXim.item.CAN_OF_AUTOMATON_OIL_P1] = 2, -- Automaton Oil + 1
    [invaderXim.item.CAN_OF_AUTOMATON_OIL_P2] = 3, -- Automaton Oil + 2
    [invaderXim.item.CAN_OF_AUTOMATON_OIL_P3] = 4  -- Automaton Oil + 3
}

-- On Ability Check Overdrive
invaderXim.job_utils.puppetmaster.onAbilityCheckOverdrive = function(player, target, ability)
    local pet = player:getPet()
    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif not pet:isAutomaton() then
        return invaderXim.msg.basic.NO_EFFECT_ON_PET, 0
    else
        ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))
        return 0, 0
    end
end

-- On Ability Use Overdrive
invaderXim.job_utils.puppetmaster.onAbilityUseOverdrive = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.OVERDRIVE, 0, 0, 60)

    return invaderXim.effect.OVERDRIVE
end

-- On Ability Check Activate
invaderXim.job_utils.puppetmaster.onAbilityCheckActivate = function(player, target, ability)
    if player:getPet() ~= nil then
        return invaderXim.msg.basic.ALREADY_HAS_A_PET, 0
    elseif not player:canUseMisc(invaderXim.zoneMisc.PET) then
        return invaderXim.msg.basic.CANT_BE_USED_IN_AREA, 0
    elseif player:isExceedingElementalCapacity() then
        return invaderXim.msg.basic.AUTO_EXCEEDS_CAPACITY, 0
    end

    return 0, 0
end

-- On Ability Use Activate
invaderXim.job_utils.puppetmaster.onAbilityUseActivate = function(player, target, ability)
    invaderXim.pet.spawnPet(player, invaderXim.petId.AUTOMATON)

    local pet = player:getPet()

    if pet then
        local jpValue = player:getJobPointLevel(invaderXim.jp.AUTOMATON_HP_MP_BONUS)
        pet:addMod(invaderXim.mod.HP, jpValue * 10)
        pet:addMod(invaderXim.mod.MP, jpValue * 5)
    end
end

-- On Ability Check Deux Ex Automata
invaderXim.job_utils.puppetmaster.onAbilityCheckDeuxExAutomata = function(player, target, ability)
    if player:getPet() ~= nil then
        return invaderXim.msg.basic.ALREADY_HAS_A_PET, 0
    elseif not player:canUseMisc(invaderXim.zoneMisc.PET) then
        return invaderXim.msg.basic.CANT_BE_USED_IN_AREA, 0
    else
        local jpValue = player:getJobPointLevel(invaderXim.jp.DEUS_EX_AUTOMATA_RECAST)

        ability:setRecast(ability:getRecast() - jpValue)

        return 0, 0
    end
end

-- On Ability Use Deux Ex Automata
invaderXim.job_utils.puppetmaster.onAbilityUseDeuxExAutomata = function(player, target, ability)
    invaderXim.pet.spawnPet(player, invaderXim.petId.AUTOMATON)
    local pet = player:getPet()

    if pet then
        local percent = math.floor((player:getMainLvl() / 3)) / 100
        pet:setHP(math.max(pet:getHP() * percent, 1))
        pet:setMP(pet:getMP() * percent)
    end
end

--Repair and Maintenance Function - TODO: verify that this function should be here and not on the items "Enhances Repair"
-- https://www.bg-wiki.com/ffxi/Repair
local function removeStatus(pet)
    for _, effectId in ipairs(removableEffectIds) do
        if pet:delStatusEffect(effectId) then
            return true
        end
    end

    if pet:eraseStatusEffect() ~= invaderXim.effect.NONE then
        return true
    end

    return false
end

-- On Ability Check Repair
invaderXim.job_utils.puppetmaster.onAbilityCheckRepair = function(player, target, ability)
    local pet = player:getPet()
    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif not pet:isAutomaton() then
        return invaderXim.msg.basic.NO_EFFECT_ON_PET, 0
    else
        local id = player:getEquipID(invaderXim.slot.AMMO)

        if oilType[id] then
            return 0, 0
        else
            return invaderXim.msg.basic.UNABLE_TO_USE_JA, 0
        end
    end
end

-- On Ability Use Repair
invaderXim.job_utils.puppetmaster.onAbilityUseRepair = function(player, target, ability)
    local pet = player:getPet()
    if not pet then
        return
    end

    local petMaxHP            = pet:getMaxHP()
    local numRemovableEffects = player:getMod(invaderXim.mod.REPAIR_EFFECT)

    -- Need to start to calculate the HP to restore to the pet.
    -- Ref: https://www.bg-wiki.com/ffxi/Repair
    local oilData      = oilType[player:getEquipID(invaderXim.slot.AMMO)]
    local regenAmount  = oilData[1]
    local totalHealing = oilData[2] * petMaxHP
    local regenTime    = oilData[3]

    for _ = 1, numRemovableEffects do
        if not removeStatus(pet) then
            break
        end
    end

    local bonus  = 1 + player:getMerit(invaderXim.merit.REPAIR_EFFECT) / 100
    totalHealing = totalHealing * bonus

    bonus       = bonus + player:getMod(invaderXim.mod.REPAIR_POTENCY) / 100
    regenAmount = regenAmount * bonus

    totalHealing = pet:addHP(totalHealing)

    pet:wakeUp()

    pet:delStatusEffect(invaderXim.effect.REGEN)
    pet:addStatusEffect(invaderXim.effect.REGEN, regenAmount, 3, regenTime) -- 3 = tick, each 3 seconds.
    player:removeAmmo()
    return totalHealing
end

-- On Ability Check Maintenance
invaderXim.job_utils.puppetmaster.onAbilityCheckMaintenance = function(player, target, ability)
    local pet = player:getPet()
    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif not pet:isAutomaton() then
        return invaderXim.msg.basic.NO_EFFECT_ON_PET, 0
    else
        local id = player:getEquipID(invaderXim.slot.AMMO)
        if idStrengths[id] then
            return 0, 0
        else
            return invaderXim.msg.basic.UNABLE_TO_USE_JA, 0
        end
    end
end

-- On Ability Use Maintenance
invaderXim.job_utils.puppetmaster.onAbilityUseMaintenance = function(player, target, ability)
    local id         = player:getEquipID(invaderXim.slot.AMMO)
    local pet        = player:getPet()
    local toRemove   = idStrengths[id] or 1
    local numRemoved = 0

    repeat
        if not removeStatus(pet) then
            break
        end

        toRemove   = toRemove - 1
        numRemoved = numRemoved + 1
    until toRemove <= 0

    player:removeAmmo()

    return numRemoved
end

-- On Ability Check RoleReversal
invaderXim.job_utils.puppetmaster.onAbilityCheckRoleReversal = function(player, target, ability)
    local pet = player:getPet()

    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif not pet:isAutomaton() then
        return invaderXim.msg.basic.NO_EFFECT_ON_PET, 0
    else
        return 0, 0
    end
end

-- On Ability Use Role Reversal
invaderXim.job_utils.puppetmaster.onAbilityUseRoleReversal = function(player, target, ability)
    local pet = player:getPet()
    if pet then
        local bonus    = 1 + (player:getMerit(invaderXim.merit.ROLE_REVERSAL) - 5) / 100
        local playerHP = player:getHP()
        local petHP    = pet:getHP()

        pet:setHP(math.max(playerHP * bonus, 1))
        player:setHP(math.max(petHP * bonus, 1))
    end
end

-- On Ability Check Ventriloquy
invaderXim.job_utils.puppetmaster.onAbilityCheckVentriloquy = function(player, target, ability)
    local pet = player:getPet()

    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif not pet:isAutomaton() then
        return invaderXim.msg.basic.NO_EFFECT_ON_PET, 0
    end

    return 0, 0
end

-- On Ability Use Ventriloquy
invaderXim.job_utils.puppetmaster.onAbilityUseVentriloquy = function(player, target, ability)
    local pet = player:getPet()
    if pet then
        local enmitylist            = target:getEnmityList()
        local playerfound, petfound = false, false

        for k, v in pairs(enmitylist) do
            if v.entity:getTargID() == player:getTargID() then
                playerfound = true
            elseif v.entity:getTargID() == pet:getTargID() then
                petfound = true
            end
        end

        if playerfound and petfound then
            local bonus             = (player:getMerit(invaderXim.merit.VENTRILOQUY) - 5) / 100
            local playerCE          = target:getCE(player)
            local playerVE          = target:getVE(player)
            local petCE             = target:getCE(pet)
            local petVE             = target:getVE(pet)
            local playerEnmityBonus = 1
            local petEnmityBonus    = 1

            if
                target:getTarget():getTargID() == player:getTargID() or
                ((playerCE + playerVE) >= (petCE + petVE) and target:getTarget():getTargID() ~= pet:getTargID())
            then
                playerEnmityBonus = playerEnmityBonus + bonus
                petEnmityBonus    = petEnmityBonus - bonus
            else
                playerEnmityBonus = playerEnmityBonus - bonus
                petEnmityBonus    = petEnmityBonus + bonus
            end

            target:setCE(player, petCE * petEnmityBonus)
            target:setVE(player, petVE * petEnmityBonus)
            target:setCE(pet, playerCE * playerEnmityBonus)
            target:setVE(pet, playerVE * playerEnmityBonus)
        end
    end
end

-- On Ability Check Tactical Switch
invaderXim.job_utils.puppetmaster.onAbilityCheckTacticalSwitch = function(player, target, ability)
    return 0, 0
end

-- On Ability Use Tactical Switch
invaderXim.job_utils.puppetmaster.onAbilityUseTacticalSwitch = function(player, target, ability)
    -- target:addStatusEffect(invaderXim.effect.TACTICAL_SWITCH, 18, 1, 1) -- TODO: implement invaderXim.effect.TACTICAL_SWITCH
end

-- On Ability Check Cooldown
invaderXim.job_utils.puppetmaster.onAbilityCheckCooldown = function(player, target, ability)
    local pet = player:getPet()

    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif not pet:isAutomaton() then
        return invaderXim.msg.basic.NO_EFFECT_ON_PET, 0
    end

    return 0, 0
end

-- On Ability Use Cooldown
invaderXim.job_utils.puppetmaster.onAbilityUseCooldown = function(player, target, ability)
    local jpValue = player:getJobPointLevel(invaderXim.jp.COOLDOWN_EFFECT)

    player:reduceBurden(50, jpValue)

    if player:hasStatusEffect(invaderXim.effect.OVERLOAD) then
        player:delStatusEffect(invaderXim.effect.OVERLOAD)
    end
end

-- On Ability Check Heady Artiface
invaderXim.job_utils.puppetmaster.onAbilityCheckHeadyArtiface = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

-- On Ability Use Heady Artiface
invaderXim.job_utils.puppetmaster.onAbilityUseHeadyArtiface = function(player, target, ability)
    -- target:addStatusEffect(invaderXim.effect.HEADY_ARTIFICE, 18, 1, 1) -- TODO: implement invaderXim.effect.HEADY_ARTIFICE
end

-- On Ability Check Deploy
invaderXim.job_utils.puppetmaster.onAbilityCheckDeploy = function(player, target, ability)
    return 0, 0
end

-- On Ability Use Deploy
invaderXim.job_utils.puppetmaster.onAbilityUseDeploy = function(player, target, ability)
    player:petAttack(target)
end

-- On Ability Check Retrieve
invaderXim.job_utils.puppetmaster.onAbilityCheckRetrieve = function(player, target, ability)
    return 0, 0
end

-- On Ability Use Retrieve
invaderXim.job_utils.puppetmaster.onAbilityUseRetrieve = function(player, target, ability)
    player:petRetreat()
end

-- On Ability Check Deactivate
invaderXim.job_utils.puppetmaster.onAbilityCheckDeactivate = function(player, target, ability)
    return 0, 0
end

-- On Ability Use Deactivate
invaderXim.job_utils.puppetmaster.onAbilityUseDeactivate = function(player, target, ability)
    -- Reset the Activate ability.
    local pet = player:getPet()

    if
        pet and
        pet:getHP() == pet:getMaxHP()
    then
        player:resetRecast(invaderXim.recast.ABILITY, 205) -- activate
    end

    target:despawnPet()
end
