-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Carnivorous Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 23, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 24, 2, invaderXim.regime.type.FIELDS)
end

return entity
