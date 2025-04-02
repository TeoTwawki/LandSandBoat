-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Rumble Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 791, 2, invaderXim.regime.type.GROUNDS)
end

return entity
