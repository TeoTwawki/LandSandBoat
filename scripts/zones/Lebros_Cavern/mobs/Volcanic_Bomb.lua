-----------------------------------
-- Area: Lebros Cavern (Excavation Duty)
--  Mob: Volcanic Bomb
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.assault.adjustMobLevel(mob)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
