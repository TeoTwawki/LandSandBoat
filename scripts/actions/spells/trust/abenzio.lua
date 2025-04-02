-----------------------------------
-- Trust: Abenzio
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.trust.spawn(caster, spell)
end

local isWearingMandragoraGear = function(player)
    local wearingHead = player:getEquipID(invaderXim.slot.HEAD) == 26705 or player:getEquipID(invaderXim.slot.HEAD) == 26706 -- Mandragora Masque or Masque + 1
    local wearingBody = player:getEquipID(invaderXim.slot.BODY) == 27854 or player:getEquipID(invaderXim.slot.BODY) == 27855 -- Mandragora Suit or Suit + 1
    return wearingHead and wearingBody
end

spellObject.onMobSpawn = function(mob)
    local master = mob:getMaster()
    if isWearingMandragoraGear(master) then
        invaderXim.trust.message(mob, invaderXim.trust.messageOffset.SPAWN)
    end
end

spellObject.onMobDespawn = function(mob)
    local master = mob:getMaster()
    if isWearingMandragoraGear(master) then
        invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DESPAWN)
    end
end

spellObject.onMobDeath = function(mob)
    local master = mob:getMaster()
    if isWearingMandragoraGear(master) then
        invaderXim.trust.message(mob, invaderXim.trust.messageOffset.DEATH)
    end
end

return spellObject
