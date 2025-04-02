-----------------------------------
-- Area: Ceizak Battlegrounds
-- NM: Unfettered Twitherym
-- !pos 210 0 115 261
-- !additem 6011
-----------------------------------
---@type TMobEntity
local entity = {}

local phaseDTApplied = { ['74_49'] = false, ['49_24'] = false, ['24_0'] = false }

local skillchainAffinities =
{
    [invaderXim.element.FIRE   ] = { invaderXim.skillchainType.FUSION,        invaderXim.skillchainType.LIQUEFACTION,  invaderXim.skillchainType.LIGHT,      invaderXim.skillchainType.LIGHT_II    },
    [invaderXim.element.WATER  ] = { invaderXim.skillchainType.REVERBERATION, invaderXim.skillchainType.DISTORTION,    invaderXim.skillchainType.DARKNESS,   invaderXim.skillchainType.DARKNESS_II },
    [invaderXim.element.THUNDER] = { invaderXim.skillchainType.IMPACTION,     invaderXim.skillchainType.FRAGMENTATION, invaderXim.skillchainType.LIGHT,      invaderXim.skillchainType.LIGHT_II    },
    [invaderXim.element.WIND   ] = { invaderXim.skillchainType.DETONATION,    invaderXim.skillchainType.FRAGMENTATION, invaderXim.skillchainType.LIGHT,      invaderXim.skillchainType.LIGHT_II    },
    [invaderXim.element.ICE    ] = { invaderXim.skillchainType.INDURATION,    invaderXim.skillchainType.DISTORTION,    invaderXim.skillchainType.DARKNESS,   invaderXim.skillchainType.DARKNESS_II },
    [invaderXim.element.EARTH  ] = { invaderXim.skillchainType.SCISSION,      invaderXim.skillchainType.GRAVITATION,   invaderXim.skillchainType.DARKNESS,   invaderXim.skillchainType.DARKNESS_II },
    [invaderXim.element.DARK   ] = { invaderXim.skillchainType.COMPRESSION,   invaderXim.skillchainType.DARKNESS,      invaderXim.skillchainType.DARKNESS_II                               },
    [invaderXim.element.LIGHT  ] = { invaderXim.skillchainType.TRANSFIXION,   invaderXim.skillchainType.LIGHT,         invaderXim.skillchainType.LIGHT_II                                  },
}

local function chooseAffinity(mob)
    local chosenElement = math.random(invaderXim.element.FIRE, invaderXim.element.DARK)
    mob:setLocalVar('chosenElement', chosenElement)
end

local function isSkillchainCorrect(mob, skillchainID)
    local chosenElement       = mob:getLocalVar('chosenElement')
    local affinitySkillchains = skillchainAffinities[chosenElement]

    for _, validSkillchain in ipairs(affinitySkillchains) do
        if skillchainID == validSkillchain then
            return true
        end
    end

    return false
end

local function applyDamageReduction(mob, phase)
    if not phaseDTApplied[phase] then
        mob:setMod(invaderXim.mod.UDMGPHYS, -9000)
        mob:setMod(invaderXim.mod.UDMGMAGIC, -9000)
        mob:setMod(invaderXim.mod.UDMGRANGE, -9000)
        mob:setMod(invaderXim.mod.UDMGBREATH, -9000)
        phaseDTApplied[phase] = true
    end
end

local function resetDamageModifiers(mob)
    for _, mod in ipairs({ invaderXim.mod.UDMGPHYS, invaderXim.mod.UDMGMAGIC, invaderXim.mod.UDMGRANGE, invaderXim.mod.UDMGBREATH }) do
        mob:setMod(mod, 0)
    end
end

local function getCurrentPhase(mob)
    local hpp = mob:getHPP()
    if hpp <= 74 and hpp > 49 then
        return '74_49'
    elseif hpp <= 49 and hpp > 24 then
        return '49_24'
    elseif hpp <= 24 then
        return '24_0'
    end

    return nil
end

entity.onMobFight = function(mob)
    if mob:getHPP() <= 50 then
        mob:setMobMod(invaderXim.mobMod.SKILL_LIST, 2018)
    else
        mob:setMobMod(invaderXim.mobMod.SKILL_LIST, 2017)
    end
end

entity.onMobSpawn = function(mob)
    local lastPhase = nil

    mob:addListener('WEAPONSKILL_USE', 'ANY_MOBSKILL_CHECK', function(mobArg, _, weaponSkill)
        local phase = getCurrentPhase(mobArg)

        if phase and phase ~= lastPhase then
            applyDamageReduction(mobArg, phase)
            lastPhase = phase

            if mobArg:getHP() <= mobArg:getMaxHP() * 0.75 then
                if mobArg:getLocalVar('chosenElement') == 0 then
                    chooseAffinity(mobArg)
                end
            end
        end
    end)

    mob:addListener('WEAPONSKILL_TAKE', 'SKILLCHAIN_DETECT', function(mobArg, _, skillID)
        if mobArg:hasStatusEffect(invaderXim.effect.SKILLCHAIN) then
            if mobArg:getLocalVar('chosenElement') ~= 0 then
                local skillchainEffect = mobArg:getStatusEffect(invaderXim.effect.SKILLCHAIN)
                local power            = skillchainEffect:getPower()

                if isSkillchainCorrect(mobArg, power) then
                    resetDamageModifiers(mobArg)
                    mobArg:setLocalVar('chosenElement', 0)
                    for phase, _ in pairs(phaseDTApplied) do
                        phaseDTApplied[phase] = false
                    end
                end
            end
        end
    end)
end

entity.onMobDeath = function(mob)
    resetDamageModifiers(mob)
end

return entity
