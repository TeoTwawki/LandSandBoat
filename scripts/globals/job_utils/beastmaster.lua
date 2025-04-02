-----------------------------------
-- Beastmaster Job Utilities
-----------------------------------
require('scripts/globals/ability')
require('scripts/globals/jobpoints')
-----------------------------------
xi = xi or {}
invaderXim.job_utils = invaderXim.job_utils or {}
invaderXim.job_utils.beastmaster = invaderXim.job_utils.beastmaster or {}
-----------------------------------
-----------------------------------
--  Jug Levels
-----------------------------------
xi = xi or {}

local jugLevelTable =
{
    [invaderXim.petId.SHEEP_FAMILIAR  ] = 23,
    [invaderXim.petId.HARE_FAMILIAR   ] = 23,
    [invaderXim.petId.CRAB_FAMILIAR   ] = 23,
    [invaderXim.petId.COURIER_CARRIE  ] = 23,
    [invaderXim.petId.HOMUNCULUS      ] = 23,
    [invaderXim.petId.FLYTRAP_FAMILIAR] = 28,
    [invaderXim.petId.TIGER_FAMILIAR  ] = 28,
    [invaderXim.petId.FLOWERPOT_BILL  ] = 28,
    [invaderXim.petId.EFT_FAMILIAR    ] = 33,
    [invaderXim.petId.LIZARD_FAMILIAR ] = 33,
    [invaderXim.petId.MAYFLY_FAMILIAR ] = 33,
    [invaderXim.petId.FUNGUAR_FAMILIAR] = 33,
    [invaderXim.petId.BEETLE_FAMILIAR ] = 38,
    [invaderXim.petId.ANTLION_FAMILIAR] = 38,
    [invaderXim.petId.MITE_FAMILIAR   ] = 43,
    [invaderXim.petId.LULLABY_MELODIA ] = 43,
    [invaderXim.petId.KEENEARED_STEFFI] = 43,
    [invaderXim.petId.FLOWERPOT_BEN   ] = 51,
    [invaderXim.petId.SABER_SIRAVARDE ] = 51,
    [invaderXim.petId.COLDBLOOD_COMO  ] = 53,
    [invaderXim.petId.SHELLBUSTER_OROB] = 53,
    [invaderXim.petId.VORACIOUS_AUDREY] = 53,
    [invaderXim.petId.AMBUSHER_ALLIE  ] = 58,
    [invaderXim.petId.LIFEDRINKER_LARS] = 63,
    [invaderXim.petId.PANZER_GALAHAD  ] = 63,
    [invaderXim.petId.CHOPSUEY_CHUCKY ] = 63,
    [invaderXim.petId.AMIGO_SABOTENDER] = 75,
    [invaderXim.petId.CRAFTY_CLYVONNE]  = 76,
    [invaderXim.petId.BLOODCLAW_SHASRA] = 90,
    [invaderXim.petId.LUCKY_LULUSH]     = 76,
    [invaderXim.petId.FATSO_FARGANN]    = 81,
    [invaderXim.petId.DISCREET_LOUISE]  = 79,
    [invaderXim.petId.SWIFT_SIEGHARD]   = 86,
    [invaderXim.petId.DIPPER_YULY]      = 76,
    [invaderXim.petId.FLOWERPOT_MERLE]  = 76,
    [invaderXim.petId.NURSERY_NAZUNA]   = 76,
    [invaderXim.petId.MAILBUSTER_CETAS] = 85,
    [invaderXim.petId.AUDACIOUS_ANNA]   = 85,
    [invaderXim.petId.PRESTO_JULIO]     = 83,
    [invaderXim.petId.BUGEYED_BRONCHA]  = 90,
    [invaderXim.petId.GOOEY_GERARD]     = 95,
    [invaderXim.petId.GOREFANG_HOBS]    = 94,
    [invaderXim.petId.FAITHFUL_FALCOR]  = 86,
    [invaderXim.petId.CRUDE_RAPHIE]     = 96,
    [invaderXim.petId.DAPPER_MAC]       = 76,
    [invaderXim.petId.SLIPPERY_SILAS]   = 23,
    [invaderXim.petId.TURBID_TOLOI]     = 75,

}

-- On Ability Check Jug (Call Beast and Bestial Loyalty)
invaderXim.job_utils.beastmaster.onAbilityCheckJug = function(player, target, ability)
    local petId = player:getWeaponSubSkillType(invaderXim.slot.AMMO)

    if player:getPet() ~= nil then
        return invaderXim.msg.basic.ALREADY_HAS_A_PET, 0
    elseif
        not player:hasValidJugPetItem() or
        player:getMainLvl() < jugLevelTable[petId]
    then
        return invaderXim.msg.basic.NO_JUG_PET_ITEM, 0
    elseif not player:canUseMisc(invaderXim.zoneMisc.PET) then
        return invaderXim.msg.basic.CANT_BE_USED_IN_AREA, 0
    end

    return 0, 0
end

-- On Ability Use Jug (Call Beast and Bestial Loyalty)
invaderXim.job_utils.beastmaster.onUseAbilityJug = function(player, target, ability)
    invaderXim.pet.spawnPet(player, player:getWeaponSubSkillType(invaderXim.slot.AMMO))

    if ability:getID() == invaderXim.jobAbility.CALL_BEAST then
        player:removeAmmo()
    end

    -- Briefly put the recastId for READY/SIC (102) into a recast state to
    -- toggle charges accumulating. 102 is the shared recast id for all jug
    -- pet abilities and for SIC when using a charmed mob.
    -- see sql/abilities_charges and sql_abilities
    player:addRecast(invaderXim.recast.ABILITY, 102, 1)
end

-- On Ability Check Familiar
invaderXim.job_utils.beastmaster.onAbilityCheckFamiliar = function(player, target, ability)
    local pet = player:getPet()

    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif
        (not player:hasJugPet() and pet:getObjType() ~= invaderXim.objType.MOB) or
        pet:getLocalVar('ReceivedFamiliar') == 1
    then
        return invaderXim.msg.basic.NO_EFFECT_ON_PET, 0
    end

    pet:setLocalVar('ReceivedFamiliar', 1)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

-- On Ability Use Familiar
invaderXim.job_utils.beastmaster.onUseAbilityFamiliar = function(player, target, ability)
    player:familiar()

    ability:setMsg(invaderXim.msg.basic.FAMILIAR_PC)

    return 0
end

-- On Ability Check Charm
invaderXim.job_utils.beastmaster.onAbilityCheckCharm = function(player, target, ability)
    if player:getPet() ~= nil then
        return invaderXim.msg.basic.ALREADY_HAS_A_PET, 0
    elseif
        target:getMaster() ~= nil and
        target:getMaster():isPC()
    then
        return invaderXim.msg.basic.THAT_SOMEONES_PET, 0
    end

    return 0, 0
end

-- On Ability Use Charm
invaderXim.job_utils.beastmaster.onUseAbilityCharm = function(player, target, ability)
    local isTamed = false

    if player:getLocalVar('Tamed_Mob') == target:getID() then
        player:addMod(invaderXim.mod.CHARM_CHANCE, 10)
        isTamed = true
    end

    -- attempt the charm and get the return message
    local msg = invaderXim.job_utils.beastmaster.attemptCharm(player, target)
    ability:setMsg(msg)

    if isTamed then
        player:delMod(invaderXim.mod.CHARM_CHANCE, 10)
        player:setLocalVar('Tamed_Mob', 0)
    end

    -- if charm bound mob then need to return bind to generate correct message
    if msg == invaderXim.msg.basic.JA_ENFEEB_IS then
        return invaderXim.effect.BIND
    end
end

-- On Ability Check Gauge
invaderXim.job_utils.beastmaster.onAbilityCheckGauge = function(player, target, ability)
    if player:getPet() ~= nil then
        return invaderXim.msg.basic.ALREADY_HAS_A_PET, 0
    end

    return 0, 0
end

-- On Ability Use Gauge
invaderXim.job_utils.beastmaster.onUseAbilityGauge = function(player, target, ability)
    local charmChance = invaderXim.job_utils.beastmaster.getCharmChance(player, target, false)

    if charmChance >= 75 then
        ability:setMsg(invaderXim.msg.basic.SHOULD_BE_ABLE_CHARM)  -- The <player> should be able to charm <target>.
    elseif charmChance >= 50 then
        ability:setMsg(invaderXim.msg.basic.MIGHT_BE_ABLE_CHARM)   -- The <player> might be able to charm <target>.
    elseif charmChance >= 25 then
        ability:setMsg(invaderXim.msg.basic.DIFFICULT_TO_CHARM)    -- It would be difficult for the <player> to charm <target>.
    elseif charmChance >= 1 then
        ability:setMsg(invaderXim.msg.basic.VERY_DIFFICULT_CHARM)  -- It would be very difficult for the <player> to charm <target>.
    else
        ability:setMsg(invaderXim.msg.basic.CANNOT_CHARM)          -- The <player> cannot charm <target>!
    end
end

-- On Ability Check Tame
invaderXim.job_utils.beastmaster.onAbilityCheckTame = function(player, target, ability)
    return 0, 0
end

-- On Ability Use Tame
-- **NOTE** Use of Battlemod may remove message
invaderXim.job_utils.beastmaster.onUseAbilityTame = function(player, target, ability)
    if player:getPet() ~= nil then
        ability:setMsg(invaderXim.msg.basic.JA_NO_EFFECT)
        target:addEnmity(player, 1, 0)

        return 0
    end

    if target:getMobMod(invaderXim.mobMod.CHARMABLE) == 0 then
        ability:setMsg(invaderXim.msg.basic.JA_NO_EFFECT)
        target:addEnmity(player, 1, 0)

        return 0
    end

    local resist = applyResistanceAbility(player, target, invaderXim.element.NONE, invaderXim.skill.NONE, player:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT))

    if resist <= 0.25 then
        ability:setMsg(invaderXim.msg.basic.JA_MISS_2)
        target:addEnmity(player, 1, 0)

        return 0
    else
        if target:isEngaged() then
            local enmitylist = target:getEnmityList()

            for _, enmity in ipairs(enmitylist) do
                if enmity.active and enmity.entity:getID() ~= player:getID() then
                    ability:setMsg(invaderXim.msg.basic.JA_NO_EFFECT)
                    target:addEnmity(player, 1, 0)

                    return 0
                elseif enmity.entity:getID() == player:getID() then
                    if not enmity.tameable then
                        ability:setMsg(invaderXim.msg.basic.JA_NO_EFFECT)
                        target:addEnmity(player, 1, 0)

                        return 0
                    end
                end
            end

            ability:setMsg(138) -- The x seems friendlier
            target:disengage()
        else
            player:setLocalVar('Tamed_Mob', target:getID())
            ability:setMsg(138) -- The x seems friendlier
        end
    end
end

-- On Ability Check Reward
invaderXim.job_utils.beastmaster.onAbilityCheckReward = function(player, target, ability)
    local pet = player:getPet()

    if not pet then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0 --TODO this currently will not hit this function. Returns You cannot attack that target. Targetfind.cpp line 564
    elseif
        not player:hasJugPet() and
        pet:getObjType() ~= invaderXim.objType.MOB
    then
        return invaderXim.msg.basic.NO_EFFECT_ON_PET, 0
    else
        local id = player:getEquipID(invaderXim.slot.AMMO)
        if
            id >= invaderXim.item.PET_FOOD_ALPHA_BISCUIT and
            id <= invaderXim.item.PET_FOOD_THETA_BISCUIT
        then
            return 0, 0
        else
            return invaderXim.msg.basic.MUST_HAVE_FOOD, 0
        end
    end
end

-- On Ability Use Reward
invaderXim.job_utils.beastmaster.onUseAbilityReward = function(player, target, ability)
    -- 1st need to get the pet food is equipped in the range slot.
    local rangeObj         = player:getEquipID(invaderXim.slot.AMMO)
    local minimumHealing   = 0
    local totalHealing     = 0
    local playerMnd        = player:getStat(invaderXim.mod.MND)
    local rewardHealingMod = player:getMod(invaderXim.mod.REWARD_HP_BONUS)
    local regenAmount      = 1 -- 1 is the minimum.
    local regenTime        = 180 -- 3 minutes
    local pet              = player:getPet()
    local petCurrentHP     = pet:getHP()
    local petMaxHP         = pet:getMaxHP()

    -- Need to start to calculate the HP to restore to the pet.
    -- Please note that I used this as base for the calculations:
    -- http://wiki.ffxiclopedia.org/wiki/Reward

    -- TODO: Create lookup table for these switches
    switch (rangeObj) : caseof {
        [invaderXim.item.PET_FOOD_ALPHA_BISCUIT] = function() -- pet food alpha biscuit
            minimumHealing = 50
            regenAmount    = 1
            totalHealing   = math.floor(minimumHealing + 2 * (playerMnd - 10))
        end,

        [invaderXim.item.PET_FOOD_BETA_BISCUIT] = function() -- pet food beta biscuit
            minimumHealing = 180
            regenAmount    = 3
            totalHealing   = math.floor(minimumHealing + 1 * (playerMnd - 33))
        end,

        [invaderXim.item.PET_FOOD_GAMMA_BISCUIT] = function() -- pet food gamma biscuit
            minimumHealing = 300
            regenAmount    = 5
            totalHealing   = math.floor(minimumHealing + 1 * (playerMnd - 35)) -- TO BE VERIFIED.
        end,

        [invaderXim.item.PET_FOOD_DELTA_BISCUIT] = function() -- pet food delta biscuit
            minimumHealing = 530
            regenAmount    = 8
            totalHealing   = math.floor(minimumHealing + 2 * (playerMnd - 40)) -- TO BE VERIFIED.
        end,

        [invaderXim.item.PET_FOOD_EPSILON_BISCUIT] = function() -- pet food epsilon biscuit
            minimumHealing = 750
            regenAmount    = 11
            totalHealing   = math.floor(minimumHealing + 2 * (playerMnd - 45))
        end,

        [invaderXim.item.PET_FOOD_ZETA_BISCUIT] = function() -- pet food zeta biscuit
            minimumHealing = 900
            regenAmount    = 14
            totalHealing   = math.floor(minimumHealing + 3 * (playerMnd - 45))
        end,

        [invaderXim.item.PET_FOOD_ETA_BISCUIT] = function() -- pet food eta biscuit
            minimumHealing = 1200
            regenAmount    = 17
            totalHealing   = math.floor(minimumHealing + 4 * (playerMnd - 50))
        end,

        [invaderXim.item.PET_FOOD_THETA_BISCUIT] = function() -- pet food theta biscuit
            minimumHealing = 1600
            regenAmount    = 20
            totalHealing   = math.floor(minimumHealing + 4 * (playerMnd - 55))
        end,
    }

    -- Now calculating the bonus based on gear.
    switch (player:getEquipID(invaderXim.slot.BODY)) : caseof {
        [invaderXim.item.BEAST_JACKCOAT] = function() -- beast jackcoat
            -- This will remove Paralyze, Poison and Blind from the pet.
            pet:delStatusEffect(invaderXim.effect.PARALYSIS)
            pet:delStatusEffect(invaderXim.effect.POISON)
            pet:delStatusEffect(invaderXim.effect.BLINDNESS)
        end,

        [invaderXim.item.BEAST_JACKCOAT_P1] = function() -- beast jackcoat +1
            -- This will remove Paralyze, Poison, Blind, Weight, Slow and Silence from the pet.
            pet:delStatusEffect(invaderXim.effect.PARALYSIS)
            pet:delStatusEffect(invaderXim.effect.POISON)
            pet:delStatusEffect(invaderXim.effect.BLINDNESS)
            pet:delStatusEffect(invaderXim.effect.WEIGHT)
            pet:delStatusEffect(invaderXim.effect.SLOW)
            pet:delStatusEffect(invaderXim.effect.SILENCE)
        end,

        [invaderXim.item.MONSTER_JACKCOAT] = function() -- monster jackcoat
            -- This will remove Weight, Slow and Silence from the pet.
            pet:delStatusEffect(invaderXim.effect.WEIGHT)
            pet:delStatusEffect(invaderXim.effect.SLOW)
            pet:delStatusEffect(invaderXim.effect.SILENCE)
        end,

        [invaderXim.item.MONSTER_JACKCOAT_P1] = function() -- monster jackcoat +1
            -- This will remove Paralyze, Poison, Blind, Weight, Slow and Silence from the pet.
            pet:delStatusEffect(invaderXim.effect.PARALYSIS)
            pet:delStatusEffect(invaderXim.effect.POISON)
            pet:delStatusEffect(invaderXim.effect.BLINDNESS)
            pet:delStatusEffect(invaderXim.effect.WEIGHT)
            pet:delStatusEffect(invaderXim.effect.SLOW)
            pet:delStatusEffect(invaderXim.effect.SILENCE)
        end,
    }

    -- Adding bonus to the total to heal.

    if
        rewardHealingMod ~= nil and
        rewardHealingMod > 0
    then
        totalHealing = totalHealing + math.floor(totalHealing * rewardHealingMod / 100)
    end

    local diff = petMaxHP - petCurrentHP

    if diff < totalHealing then
        totalHealing = diff
    end

    pet:addHP(totalHealing)
    pet:wakeUp()

    -- Apply regen invaderXim.effect.

    pet:delStatusEffect(invaderXim.effect.REGEN)
    pet:addStatusEffect(invaderXim.effect.REGEN, regenAmount, 3, regenTime) -- 3 = tick, each 3 seconds.
    player:removeAmmo()

    pet:updateEnmityFromCure(pet, totalHealing)

    return totalHealing
end

-- On Ability Check Unleash
invaderXim.job_utils.beastmaster.onAbilityCheckUnleash = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

-- On Ability Use Unleash
invaderXim.job_utils.beastmaster.onUseAbilityUnleash = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.UNLEASH, 9, 0, 60)
end

-- On Ability Check For Leave, Heel and Stay.
invaderXim.job_utils.beastmaster.onAbilityCheckNilPet = function(player, target, ability)
    local pet = player:getPet()

    if
        player:hasJugPet() or
        pet:getObjType() == invaderXim.objType.MOB
    then
        if player:getPet() == nil then
            return invaderXim.msg.basic.REQUIRES_A_PET, 0
        end
    end

    return 0, 0
end

-- On Ability Use Leave
invaderXim.job_utils.beastmaster.onUseAbilityLeave = function(player, target, ability)
    target:despawnPet()
end

-- On Ability Check Snarl
invaderXim.job_utils.beastmaster.onAbilityCheckSnarl = function(player, target, ability)
    if player:getPet() == nil then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    else
        if
            player:getPet():getTarget() ~= nil and
            player:hasJugPet()
        then
            return 0, 0
        else
            return invaderXim.msg.basic.PET_CANNOT_DO_ACTION, 0
        end
    end
end

-- On Ability Use Snarl
invaderXim.job_utils.beastmaster.onUseAbilitySnarl = function(player, target, ability)
    player:transferEnmity(player:getPet(), 99, 11.5)
end

-- On Ability Use Heel
invaderXim.job_utils.beastmaster.onUseAbilityHeel = function(player, target, ability)
    local pet = player:getPet()

    if pet:hasStatusEffect(invaderXim.effect.HEALING) then
        pet:delStatusEffect(invaderXim.effect.HEALING)
    end

    player:petRetreat()
end

-- On Ability Use Stay
invaderXim.job_utils.beastmaster.onUseAbilityStay = function(player, target, ability)
    local pet = player:getPet()

    if not pet:hasPreventActionEffect() then
        -- reduce tick speed based on level. but never less than 5 and never
        -- more than 10.  This seems to mimic retail.  There is no formula
        -- that I can find, but this seems close.
        local level = 0
        if player:getMainJob() == invaderXim.job.BST then
            level = player:getMainLvl()
        elseif player:getSubJob() == invaderXim.job.BST then
            level = player:getSubLvl()
        end

        local tick = 10 - math.ceil(math.max(0, level / 20))

        pet:addStatusEffectEx(invaderXim.effect.HEALING, 0, 0, tick, 0)
        pet:setAnimation(0)
    end
end

-- On Ability Check Fight
invaderXim.job_utils.beastmaster.onAbilityCheckFight = function(player, target, ability)
    if player:getPet() == nil then
        return invaderXim.msg.basic.REQUIRES_A_PET, 0
    elseif
        target:getID() == player:getPet():getID() or
        (target:getMaster() ~= nil and target:getMaster():isPC())
    then
        return invaderXim.msg.basic.CANNOT_ATTACK_TARGET, 0
    end

    return 0, 0
end

-- On Ability Use Stay
invaderXim.job_utils.beastmaster.onUseAbilityFight = function(player, target, ability)
    local pet = player:getPet()

    if player:checkDistance(pet) <= 25 then
        if pet:hasStatusEffect(invaderXim.effect.HEALING) then
            pet:delStatusEffect(invaderXim.effect.HEALING)
        end

        player:petAttack(target)
    end
end

local function getCharmDuration(charmer, target)
    local charmDuration = 0

    -- Calculate base duration (see https://www.bg-wiki.com/ffxi/Charm_Duration) and dLvl
    local baseCharmDuration = math.floor(1.25 * charmer:getStat(invaderXim.mod.CHR) + 150)
    local dLvl = charmer:getMainLvl() - target:getMainLvl()

    -- Default multiplier for dLvl -6 or lower
    local dLvlCharmMult = 1 / 24

    if dLvl >= -6 and dLvl < 9 then
        -- Quintic least squares fitting of duration multiplier as function of dLvl (r^2 > 0.999)
        -- Fitting on values from table at https://www.bg-wiki.com/ffxi/Charm_Duration
        -- See fitting at https://mycurvefit.com/index.html?action=openshare&id=358a5d99-4499-4a6a-bbfe-0a667739335c
        dLvlCharmMult = 0.9997336 + 0.3652882 * dLvl + 0.02097742 * dLvl^2
                    - 0.004106429 * dLvl^3 + 0.000007231037 * dLvl^4
                    + 0.00005102634 * dLvl^5
    -- Caps at dLvl > 9
    elseif dLvl >= 9 then
        dLvlCharmMult = 6
    end

    -- Apply the dLvl multiplier
    charmDuration = baseCharmDuration * dLvlCharmMult

    -- Apply charm duration extension from gear
    local charmTimeMod = charmer:getMod(invaderXim.mod.CHARM_TIME)
    local extraDurationFromMod = charmDuration * (charmTimeMod * 0.5 / 10) -- Assumes 5% per charmTimeMod
    charmDuration = charmDuration + extraDurationFromMod

    return math.floor(charmDuration)
end

invaderXim.job_utils.beastmaster.getCharmChance = function(charmer, target, includeMods)
    if
        not charmer or                                -- Invalid charmer
        not target or                                 -- Invalid target
        not charmer:isPC() or                         -- Charmer not a player
        not target:isMob() or                         -- Target not a mob
        target:getMobMod(invaderXim.mobMod.CHARMABLE) == 0 or -- Not charmable
        target:getMaster() ~= nil                     -- Someone else's pet
    then
        return 0
    end

    -- Use the players BST level (even if subjob) for charm chance calc
    local charmerJobLevel = charmer:getJobLevel(invaderXim.job.BST)
    local targetLevel     = target:getMainLvl()
    local charmres        = target:getMod(invaderXim.mod.CHARMRES)
    local charmChance     = 50 - charmres
    -- dLvl only applies when player lvl < mob lvl
    -- and varies for different target levels
    if charmerJobLevel < targetLevel then
        if targetLevel >= 71 then
            charmChance = charmChance - 10 * (targetLevel - charmerJobLevel)
        elseif targetLevel >= 51 then
            charmChance = charmChance - 5 * (targetLevel - charmerJobLevel)
        else
            charmChance = charmChance - 3 * (targetLevel - charmerJobLevel)
        end
    end

    -- Another multiplier determined by target light res rank
    -- as charm is a light based ability
    local rank = target:getMod(invaderXim.mod.LIGHT_RES_RANK)
    if rank <= -3 then
        charmChance = charmChance * 1.5
    elseif rank <= -2 then
        charmChance = charmChance * 1.4
    elseif rank <= -1 then
        charmChance = charmChance * 1.2
    elseif rank <= 0 then
        charmChance = charmChance
    else
        charmChance = charmChance / 2
    end

    -- Need a includeMods param because staves (which give CHARM_CHANCE) are not taken into account for Gauge
    if includeMods then
        charmChance = charmChance + charmer:getMod(invaderXim.mod.CHARM_CHANCE)
    end

    -- apply the dCHR component
    local dCHR = charmer:getStat(invaderXim.mod.CHR) - target:getStat(invaderXim.mod.CHR)
    charmChance = charmChance + dCHR

    return utils.clamp(charmChance, 0, 95)
end

invaderXim.job_utils.beastmaster.attemptCharm = function(charmer, target)
    if
        not charmer or         -- Invalid charmer
        not target or          -- Invalid target
        not charmer:isPC() or  -- Charmer not a player
        not (target:isMob() or -- Target not a mob or PC
        target:isPC())
    then
        return invaderXim.msg.basic.JA_MISS
    elseif
        -- Not charmable so apply bind
        target:getMobMod(invaderXim.mobMod.CHARMABLE) == 0 or -- Target is not charmable
        target:isPC() or                              -- Target is a PC (ballista)
        target:getMaster()                            -- Target already has a master
    then
        local resist = applyResistanceAddEffect(charmer, target, invaderXim.element.ICE, 0)
        if not target:hasStatusEffect(invaderXim.effect.BIND) and resist >= 0.5 then
            target:addStatusEffect(invaderXim.effect.BIND, 1, 0, math.random(1, 5))
            return invaderXim.msg.basic.JA_ENFEEB_IS
        else
            return invaderXim.msg.basic.JA_MISS
        end
    end

    -- Calculate charm chance
    local chance = invaderXim.job_utils.beastmaster.getCharmChance(charmer, target, true)

    -- If successful then calculate duration and charm
    if chance > math.random(1, 100) then
        local duration = getCharmDuration(charmer, target)

        if duration > 0 then
            charmer:charm(target, duration)
            return invaderXim.msg.basic.CHARM_SUCCESS
        end
    end

    return invaderXim.msg.basic.CHARM_FAIL
end
