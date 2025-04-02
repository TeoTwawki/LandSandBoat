-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Brook Sahagin
-- Note: PH for Qull the Shellbuster
-----------------------------------
local ID = zones[invaderXim.zone.SEA_SERPENT_GROTTO]
-----------------------------------
---@type TMobEntity
local entity = {}

local qullPHTable =
{
    [ID.mob.QULL_THE_SHELLBUSTER - 5] = ID.mob.QULL_THE_SHELLBUSTER, -- 348.293 10.133 -65.543
    [ID.mob.QULL_THE_SHELLBUSTER - 2] = ID.mob.QULL_THE_SHELLBUSTER, -- 363.430 10.578 -62.752
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 806, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 807, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 808, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, qullPHTable, 10, 7200) -- 2 hours
end

return entity
