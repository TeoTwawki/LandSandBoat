-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Royal Leech
-- Note: PH for Masan
-----------------------------------
local ID = zones[invaderXim.zone.SEA_SERPENT_GROTTO]
-----------------------------------
---@type TMobEntity
local entity = {}

local masanPHTable =
{
    [ID.mob.MASAN - 4] = ID.mob.MASAN, -- 17.001 9.340 186.571
    [ID.mob.MASAN - 3] = ID.mob.MASAN, -- 18.702 9.512 183.594
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 804, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, masanPHTable, 10, 14400) -- 4 hours
end

return entity
