-----------------------------------
--  MOB: Eiri Samasriri
-- Area: Nyzul Isle
-- Info: Enemy Leader, Spams Frog Song
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobWeaponSkillPrepare = function(mob, target)
    if math.random(1, 4) > 1 then
        return 1957
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.enemyLeaderKill(mob)
        local instance = mob:getInstance()
        if not instance then
            return
        end

        local chars = instance:getChars()

        for _, entities in ipairs(chars) do
            if player:hasStatusEffect(invaderXim.effect.COSTUME) then
                player:delStatusEffect(invaderXim.effect.COSTUME)
            end
        end
    end
end

return entity
