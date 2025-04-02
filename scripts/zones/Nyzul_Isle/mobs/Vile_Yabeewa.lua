-----------------------------------
--  MOB: Vile Yabeewa
-- Area: Nyzul Isle
-- Info: Enemy Leader
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.enemyLeaderKill(mob)
    end
end

return entity
