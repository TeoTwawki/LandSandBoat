-----------------------------------
-- Area: Dynamis - Tavnazia
--  Mob: Statue Prototype
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.dynamis.timeExtensionOnDeath(mob, player, optParams)
end

return entity
