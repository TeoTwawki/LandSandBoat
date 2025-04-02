-----------------------------------
--  MOB: Quick Draw Sasaroon
-- Area: Nyzul Isle
-- Info: Enemy Leader, Ranger
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
