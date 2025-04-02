-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Greatclaw
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 811, 2, invaderXim.regime.type.GROUNDS)
end

return entity
