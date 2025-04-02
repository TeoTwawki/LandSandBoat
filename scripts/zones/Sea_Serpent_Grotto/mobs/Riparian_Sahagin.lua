-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Riparian Sahagin
-- Note: PH for Seww the Squidlimbed and Fyuu the Seabellow
-----------------------------------
local ID = zones[invaderXim.zone.SEA_SERPENT_GROTTO]
-----------------------------------
---@type TMobEntity
local entity = {}

local fyuuPHTable =
{
    [ID.mob.FYUU_THE_SEABELLOW - 3] = ID.mob.FYUU_THE_SEABELLOW, -- 185.074 20.252 39.317
}

local sewwPHTable =
{
    [ID.mob.SEWW_THE_SQUIDLIMBED - 3] = ID.mob.SEWW_THE_SQUIDLIMBED, -- 232.828 9.860 63.214
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 806, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 807, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 808, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, sewwPHTable, 10, 7200) -- 2 hours
    invaderXim.mob.phOnDespawn(mob, fyuuPHTable, 10, 7200) -- 2 hours
end

return entity
