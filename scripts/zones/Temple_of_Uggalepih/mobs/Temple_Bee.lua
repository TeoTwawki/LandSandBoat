-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Temple Bee
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 790, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 793, 2, invaderXim.regime.type.GROUNDS)
end

return entity
