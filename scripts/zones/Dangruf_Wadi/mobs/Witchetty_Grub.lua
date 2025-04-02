-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Witchetty Grub
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 643, 1, invaderXim.regime.type.GROUNDS)
end

return entity
