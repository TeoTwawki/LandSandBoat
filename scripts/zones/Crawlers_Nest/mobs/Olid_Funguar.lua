-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Olid Funguar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 694, 2, invaderXim.regime.type.GROUNDS)
end

return entity
