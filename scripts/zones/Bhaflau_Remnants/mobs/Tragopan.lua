-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Tragopan
-----------------------------------

---@type TMobEntity
local entity = {}

-- mob takes double dmg
entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.UDMGMAGIC, 1000)
    mob:setMod(invaderXim.mod.UDMGPHYS, 100)
    mob:setMod(invaderXim.mod.UDMGRANGE, 100)

    -- TODO:
    -- mob:setMobMod(invaderXim.mobMod.SPAWN_ROAMED, 0)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
