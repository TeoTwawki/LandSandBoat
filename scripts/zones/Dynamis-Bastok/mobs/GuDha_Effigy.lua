-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Gu'Dha Effigy
-- Note: Mega Boss
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.dynamis.megaBossOnDeath(mob, player, optParams)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 4401 })
end

return entity
