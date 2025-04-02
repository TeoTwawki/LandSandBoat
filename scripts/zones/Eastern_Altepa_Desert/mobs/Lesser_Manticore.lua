-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Lesser Manticore
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 112, 4, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 113, 4, invaderXim.regime.type.FIELDS)
end

return entity
