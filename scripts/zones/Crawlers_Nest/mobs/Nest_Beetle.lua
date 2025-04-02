-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Nest Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 688, 2, invaderXim.regime.type.GROUNDS)
end

return entity
