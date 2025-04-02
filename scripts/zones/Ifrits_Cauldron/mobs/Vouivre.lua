-----------------------------------
-- Area: Ifrits Cauldron
--   NM: Vouivre
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 402)
end

return entity
