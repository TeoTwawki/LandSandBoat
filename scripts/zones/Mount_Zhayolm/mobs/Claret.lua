-----------------------------------
-- Area: Mount Zhayolm
--  ZNM: Claret
-- !pos 501 -9 53
-- Spawned with Pectin: !additem 2591
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Claret
-----------------------------------
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
    mob:setMobMod(invaderXim.mobMod.TARGET_DISTANCE_OFFSET, 50)
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[rage]timer', 3600) -- 60 minutes
    mob:addMod(invaderXim.mod.REGEN, math.floor(mob:getMaxHP() * 0.004))
    mob:addMod(invaderXim.mod.BIND_MEVA, 40)
    mob:addMod(invaderXim.mod.MOVE_SPEED_STACKABLE, 15)
    mob:setAutoAttackEnabled(false)
end

entity.onMobFight = function(mob, target)
    if mob:checkDistance(target) < 3 then
        if not target:hasStatusEffect(invaderXim.effect.POISON) then
            target:addStatusEffect(invaderXim.effect.POISON, 100, 3, math.random(3, 6) * 3) -- Poison for 3-6 ticks.
        else
            if target:getStatusEffect(invaderXim.effect.POISON):getPower() < 100 then
                target:delStatusEffect(invaderXim.effect.POISON)
                target:addStatusEffect(invaderXim.effect.POISON, 100, 3, math.random(3, 6) * 3) -- Poison for 3-6 ticks.
            end
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
