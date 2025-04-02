-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Hornfly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 690, 2, invaderXim.regime.type.GROUNDS)
end

return entity
