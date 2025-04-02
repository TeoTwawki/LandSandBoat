-----------------------------------
-- ID: 14960
-- Evoker's Gages
-- Pet mod via latent effect
-----------------------------------
---@type TItem
local itemObject = {}
local listenerPrefix = 'PET_MOD_LATENT'
local latentPetId = invaderXim.petId.LEVIATHAN
local latentMods =
{
    { invaderXim.mod.ATT, 10 },
}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemEquip  = function(user, item)
    local listenerName = fmt('{}_{}', listenerPrefix, item:getID())
    invaderXim.itemUtils.handlePetLatentMods(user, latentPetId, latentMods, true)

    user:addListener('MAGIC_STATE_IXIMT', listenerName, function(player, spell)
        if spell:getSpellGroup() == invaderXim.magic.spellGroup.SUMMONING then
            invaderXim.itemUtils.handlePetLatentMods(user, latentPetId, latentMods, true)
        end
    end)
end

itemObject.onItemUnequip = function(user, item)
    local listenerName = fmt('{}_{}', listenerPrefix, item:getID())
    invaderXim.itemUtils.handlePetLatentMods(user, latentPetId, latentMods, false)

    user:removeListener(listenerName)
end

return itemObject
