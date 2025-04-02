-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Desert Dhalmel
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 111, 3, invaderXim.regime.type.FIELDS)
end

return entity
