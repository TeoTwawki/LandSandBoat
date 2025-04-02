-----------------------------------
-- Pet Global Functions
-----------------------------------
require('scripts/globals/nyzul/pathos')
-----------------------------------
xi = xi or {}
invaderXim.pet = invaderXim.pet or {}

invaderXim.pet.spawnPet = function(player, petID)
    player:spawnPet(petID)

    -- Nyzul Isle has Pathos set randomly on floors and is recorded as bits in a localvar of the instance
    if player:getZoneID() == invaderXim.zone.NYZUL_ISLE then
        invaderXim.nyzul.addPetSpawnPathos(player)
    end
end
