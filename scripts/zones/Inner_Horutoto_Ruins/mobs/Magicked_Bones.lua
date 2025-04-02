-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Magicked Bones
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobRoam = function(mob)
    local totd = VanadielTOTD()
    if totd ~= invaderXim.time.NIGHT and totd ~= invaderXim.time.MIDNIGHT then
        DespawnMob(mob:getID())
    end
end

return entity
