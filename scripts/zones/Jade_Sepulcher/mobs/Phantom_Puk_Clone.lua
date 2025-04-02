-----------------------------------
-- Area: Jade Sepulcher
--   NM: Phantom Puk (Clone)
-----------------------------------
mixins = { require('scripts/mixins/families/puk') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addStatusEffect(invaderXim.effect.BLINK, 3, 0, 180)
    mob:setMod(invaderXim.mod.DMG, 10000)
    mob:setMod(invaderXim.mod.HP, 0)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
