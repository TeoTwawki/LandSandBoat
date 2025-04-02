-----------------------------------
-- Area: Misareaux Coast
--   NM: Gration
-----------------------------------
mixins = { require('scripts/mixins/fomor_hate') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 900)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 18000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 18000)
    mob:addImmunity(invaderXim.immunity.STUN)
    mob:addListener('ITEM_DROPS', 'ITEM_DROPS_GRATION', function(mobArg, loot)
        loot:addItemFixed(invaderXim.item.TATAMI_SHIELD, mob:getLocalVar('DropRate'))
    end)
end

entity.onMobSpawn = function(mob)
    mob:addStatusEffect(invaderXim.effect.KILLER_INSTINCT, 40, 0, 0)
    mob:setLocalVar('fomorHateAdj', 2)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
