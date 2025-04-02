-----------------------------------
-- Area: Gusgen Mines
--   NM: Wounded Wurfel
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobRoam = function(mob)
    local totd = VanadielTOTD()
    if totd ~= invaderXim.time.NEW_DAY and totd ~= invaderXim.time.MIDNIGHT then
        DespawnMob(mob:getID())
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 234)
    mob:setLocalVar('cooldown', os.time() + (144 * 13)) -- 13 vanadiel hours guarantees it will not spawn twice in the same night
end

return entity
