-----------------------------------
-- Area: Batallia Downs (105)
--  Mob: Tottering Toby
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 161)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 151 })
end

return entity
