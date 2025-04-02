-----------------------------------
-- Area: Pso'Xja
--   NM: Golden-Tongued Culberry
-----------------------------------
mixins = { require('scripts/mixins/families/tonberry') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 900)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 18000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 19800)
    mob:setMobMod(invaderXim.mobMod.HP_HEAL_CHANCE, 90)
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 6)
    mob:setMod(invaderXim.mod.FASTCAST, 50)
    mob:setMod(invaderXim.mod.MDEF, 33)
    mob:setMod(invaderXim.mod.SPELLINTERRUPT, 2)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addListener('ITEM_DROPS', 'ITEM_DROPS_CULBERRY', function(mobArg, loot)
        loot:addItemFixed(invaderXim.item.UGGALEPIH_PENDANT, mob:getLocalVar('DropRate'))
    end)
end

entity.onMobFight = function(mob, target)
    mob:setAutoAttackEnabled(false)
    mob:setMobAbilityEnabled(false)
    if target:isPet() then
        mob:setMod(invaderXim.mod.FASTCAST, 100)
        mob:castSpell(367, target) -- Insta-death any pet with most enmity.
        mob:setMod(invaderXim.mod.FASTCAST, 10)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
