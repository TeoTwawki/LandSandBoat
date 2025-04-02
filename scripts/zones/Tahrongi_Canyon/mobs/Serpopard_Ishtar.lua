-----------------------------------
-- Area: Tahrongi Canyon
--   NM: Serpopard Ishtar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 257)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 150 })
end

return entity
