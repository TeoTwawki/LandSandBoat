-----------------------------------
-- Area: Dynamis-Tavnazia
--  Mob: Diabolos Spade
-- Note: Mega Boss
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.dynamis.megaBossOnDeath(mob, player, optParams)
    player:addTitle(invaderXim.title.NIGHTMARE_AWAKENER)
end

return entity
