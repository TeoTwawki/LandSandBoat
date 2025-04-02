-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Witch Hazel
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 689, 2, invaderXim.regime.type.GROUNDS)
end

return entity
