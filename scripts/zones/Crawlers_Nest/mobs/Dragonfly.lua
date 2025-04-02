-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Dragonfly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 691, 3, invaderXim.regime.type.GROUNDS)
end

return entity
