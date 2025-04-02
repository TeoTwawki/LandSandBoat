-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Funditor
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 111, 1, invaderXim.regime.type.FIELDS)
end

return entity
