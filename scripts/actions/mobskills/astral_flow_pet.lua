-----------------------------------
-- Astral Flow
-- make existing pet use astral flow skill
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

local function petInactive(pet)
    return
        pet:hasStatusEffect(invaderXim.effect.LULLABY) or
        pet:hasStatusEffect(invaderXim.effect.STUN) or
        pet:hasStatusEffect(invaderXim.effect.PETRIFICATION) or
        pet:hasStatusEffect(invaderXim.effect.SLEEP_II) or
        pet:hasStatusEffect(invaderXim.effect.SLEEP_I) or
        pet:hasStatusEffect(invaderXim.effect.TERROR)
end

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local pet = mob:getPet()

    -- pet must be an avatar, and active
    if
        not pet or
        pet:getEcosystem() ~= 5 or
        petInactive(pet)
    then
        return 1
    end

    return 0
end

-- [mobskillId] = { petFamily1, petFamily2, ... }
local petAstralFlowAbility =
{
    [invaderXim.mobSkill.HOWLING_MOON_2]  = { 36, 381 }, -- Fenrir (Howling Moon)
    [invaderXim.mobSkill.INFERNO_1]       = { 38, 383 }, -- Ifrit (Inferno)
    [invaderXim.mobSkill.EARTHEN_FURY_1]  = { 45, 388 }, -- Titan (Earthen Fury)
    [invaderXim.mobSkill.TIDAL_WAVE_1]    = { 40, 384 }, -- Leviathan (Tidal Wave)
    [invaderXim.mobSkill.AERIAL_BLAST_1]  = { 37, 382 }, -- Garuda (Aerial Blast)
    [invaderXim.mobSkill.DIAMOND_DUST_1]  = { 44, 387 }, -- Shiva (Diamond Dust)
    [invaderXim.mobSkill.JUDGMENT_BOLT_1] = { 43, 386 }, -- Ramuh (Judgment Bolt)
    [invaderXim.mobSkill.SEARING_LIGHT_1] = { 34, 379 }, -- Carbuncle (Searing Light)
}

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local pet = mob:getPet()
    if not pet then
        return
    end

    skill:setMsg(invaderXim.msg.basic.USES)

    -- no effect if pet is inactive
    if petInactive(pet) then
        return invaderXim.effect.ASTRAL_FLOW
    end

    -- Find proper pet skill
    local petFamily = pet:getFamily()
    local skillId   = invaderXim.mobSkill.SEARING_LIGHT_1 -- Default to Searing Light if not found below

    for mobSkillId, petFamilyList in pairs(petAstralFlowAbility) do
        if utils.contains(petFamily, petFamilyList) then
            skillId = mobSkillId
            break
        end
    end

    pet:useMobAbility(skillId)

    return invaderXim.effect.ASTRAL_FLOW
end

return mobskillObject
