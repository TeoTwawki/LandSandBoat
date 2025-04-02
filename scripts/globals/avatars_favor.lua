-----------------------------------
-- Avatars Favor helper
-----------------------------------
require('scripts/globals/pets')
-----------------------------------
xi = xi or {}
invaderXim.avatarsFavor = invaderXim.avatarsFavor or {}

invaderXim.avatarsFavor.skillLevels =
{
    [1] = 316,
    [2] = 381,
    [3] = 446,
    [4] = 511,
    [5] = 574,
    [6] = 669,
    [7] = 670,
}

-- Based on BGWiki Power 8 -> 11 is only available with +Avatars Favor Gear + Job Point Gift
-- Avatar Favor buffs scale per tick (~9 seconds) to a max value based on current summoning skill
local avatarsFavorEffect =
{
    [invaderXim.petId.CARBUNCLE] = -- Regen
    {
        scaling = { 12, 14, 16, 18, 20, 21, 24, 26, 27, 28, 29 },
        effect = invaderXim.effect.CARBUNCLES_FAVOR
    },

    [invaderXim.petId.FENRIR] = -- Magic Eva
    {
        scaling = { 1, 2, 3, 4, 5, 7, 9, 12, 15, 18, 21 },
        effect = invaderXim.effect.FENRIRS_FAVOR
    },

    [invaderXim.petId.IFRIT] = -- Double Attack
    {
        scaling = { 12, 12, 15, 15, 23, 23, 24, 24, 25, 25, 26 },
        effect = invaderXim.effect.IFRITS_FAVOR
    },

    [invaderXim.petId.TITAN] = -- Defense
    {
        scaling = { 57, 62, 67, 72, 77, 82, 87, 92, 97, 102, 107 },
        effect = invaderXim.effect.TITANS_FAVOR
    },

    [invaderXim.petId.LEVIATHAN] = -- Magic Accuracy
    {
        scaling = { 1, 2, 3, 4, 5, 7, 9, 12, 15, 18, 21 },
        effect = invaderXim.effect.LEVIATHANS_FAVOR
    },

    [invaderXim.petId.GARUDA] = -- Evasion
    {
        scaling = { 12, 15, 18, 22, 25, 28, 31, 34, 37, 40, 43 },
        effect = invaderXim.effect.GARUDAS_FAVOR
    },

    [invaderXim.petId.SHIVA] = -- Magic Attack
    {
        scaling = { 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45 },
        effect = invaderXim.effect.SHIVAS_FAVOR
    },

    [invaderXim.petId.RAMUH] = -- Potency (Critical Hit+%)
    {
        scaling = { 12, 14, 16, 18, 19, 21, 21, 23, 23, 24, 24 },
        effect = invaderXim.effect.RAMUHS_FAVOR
    },

    [invaderXim.petId.DIABOLOS] = -- Refresh
    {
        scaling = { 3, 4, 4, 5, 5, 5, 6, 7, 7, 8, 8 },
        effect = invaderXim.effect.DIABOLOSS_FAVOR
    },

    [invaderXim.petId.CAIT_SITH] = -- Magic Defense
    {
        scaling = { 10, 12, 14, 16, 18, 20, 22, 24, 26, 27, 28 },
        effect = invaderXim.effect.CAIT_SITHS_FAVOR
    },

    [invaderXim.petId.SIREN] = -- Subtle Blow
    {
        scaling = { 9, 11, 13, 15, 17, 19, 20, 21, 22, 23 },
        effect = invaderXim.effect.SIRENS_FAVOR
    },
}
-----------------------------------
-- Given a :getPetID petID (Not a getMobID)
-- Returns if Avatars Favor should be applied
-- This equates to is the pet not nil and should have avatars favor effect
-- Does not account for Siren
-----------------------------------
local shouldAvatarsFavorBeApplied = function(petId)
    local shouldApply = false

    if petId and petId >= invaderXim.petId.CARBUNCLE and petId <= invaderXim.petId.DIABOLOS then
        shouldApply = true
    end

    if petId and (petId == invaderXim.petId.CAIT_SITH or petId == invaderXim.petId.SIREN) then
        shouldApply = true
    end

    return shouldApply
end

local removeAvatarsFavorDebuffsFromPet = function(target)
    local pet = target:getPet()
    if pet then
        local petId = pet:getPetID()
        if  -- Different pet states for in and out of retail / eras
            shouldAvatarsFavorBeApplied(petId) and
            invaderXim.settings.main.ENABLE_SOA == 0
        then
            pet:addMod(invaderXim.mod.MATT, 20)
            pet:addMod(invaderXim.mod.ATTP, 20)
            pet:addMod(invaderXim.mod.ACC, 10)
            pet:addMod(invaderXim.mod.DEFP, 10)
        end
    end
end

invaderXim.avatarsFavor.applyAvatarsFavorAuraToPet = function(target, effect)
    local pet = target:getPet()
    if pet then
        local petId = pet:getPetID()
        if shouldAvatarsFavorBeApplied(petId) then
            local power = avatarsFavorEffect[petId].scaling[effect:getPower()]
            local avatarEffect = avatarsFavorEffect[petId].effect

            --Useful debug message
            --printf('Power %d, Effect %d', effect:getPower(), power)

            pet:addStatusEffectEx(avatarEffect, avatarEffect, 6, 3, 15, avatarEffect, power, invaderXim.auraTarget.ALLIES, bit.bor(invaderXim.effectFlag.NO_LOSS_MESSAGE, invaderXim.effectFlag.AURA))
        end
    end
end

invaderXim.avatarsFavor.removeAvatarsFavorAuraFromPet = function(target)
    local pet = target:getPet()
    if pet then
        local petId = pet:getPetID()
        if shouldAvatarsFavorBeApplied(petId) then
            if pet:hasStatusEffect(avatarsFavorEffect[petId].effect) then
                pet:delStatusEffect(avatarsFavorEffect[petId].effect)
            end

            removeAvatarsFavorDebuffsFromPet(target)
        end
    end
end

invaderXim.avatarsFavor.applyAvatarsFavorDebuffsToPet = function(target)
    local pet = target:getPet()
    if pet then
        local petId = pet:getPetID()
        if  -- Different pet states for in and out of retail / eras
            shouldAvatarsFavorBeApplied(petId) and
            invaderXim.settings.main.ENABLE_SOA == 0
        then
            pet:delMod(invaderXim.mod.MATT, 20) -- Other than MATT most of these values are myth and guesses from multiple sources
            pet:delMod(invaderXim.mod.ATTP, 20)
            pet:delMod(invaderXim.mod.ACC, 10)
            pet:delMod(invaderXim.mod.DEFP, 10)
        end
    end
end
