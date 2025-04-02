-----------------------------------
--  MOB: Oriri Samariri
-- Area: Nyzul Isle
-- Info: Enemy Leader
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.enemyLeaderKill(mob)
        local instance = mob:getInstance()
        if not instance then
            return
        end

        local chars    = instance:getChars()

        for _, entities in ipairs(chars) do
            if player:hasStatusEffect(invaderXim.effect.COSTUME) then
                player:delStatusEffect(invaderXim.effect.COSTUME)
            end
        end
    end
end

return entity
