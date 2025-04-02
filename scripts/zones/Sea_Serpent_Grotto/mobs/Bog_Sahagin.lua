-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Bog Sahagin
-- Note: PH for Mouu the Waverider
-----------------------------------
local ID = zones[invaderXim.zone.SEA_SERPENT_GROTTO]
-----------------------------------
---@type TMobEntity
local entity = {}

local mouuPHTable =
{
    [ID.mob.MOUU_THE_WAVERIDER - 1] = ID.mob.MOUU_THE_WAVERIDER, -- -60.728 19.884 53.966
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 806, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 807, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 808, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, mouuPHTable, 10, 7200) -- 2 hours
end

return entity
