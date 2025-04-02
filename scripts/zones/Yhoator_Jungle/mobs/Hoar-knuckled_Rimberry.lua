-----------------------------------
-- Area: Yhoator Jungle
--   NM: Hoar-knuckled Rimberry
--   WOTG Nov 2009 NM: Immune to Bind, Sleep, Gravity.
-----------------------------------
mixins = { require('scripts/mixins/families/tonberry') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 368)
    invaderXim.regime.checkRegime(player, mob, 133, 1, invaderXim.regime.type.FIELDS)
end

return entity
