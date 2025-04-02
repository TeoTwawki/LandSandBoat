-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Dancing Jewel
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 694, 1, invaderXim.regime.type.GROUNDS)
end

return entity
