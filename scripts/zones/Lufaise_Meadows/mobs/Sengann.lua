-----------------------------------
-- Area: Lufaise Meadows
--  Mob: Sengann
-----------------------------------
mixins = { require('scripts/mixins/fomor_hate') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 441)
end

return entity
