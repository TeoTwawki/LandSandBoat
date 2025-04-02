-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Poroggo Excavator
-----------------------------------
mixins = { require('scripts/mixins/families/poroggo') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 625, 2, invaderXim.regime.type.GROUNDS)
end

return entity
