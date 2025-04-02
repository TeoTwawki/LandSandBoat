-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Bifrons
-----------------------------------
require('scripts/zones/Bhaflau_Remnants/globals/zoneUtil')
-----------------------------------

---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addListener('ITEM_DROPS', 'BIFRONS_ITEM_DROPS', function(mobArg, loot)
        local cell1, cell2, cell3 = invaderXim.zoneUtil.pickList(mobArg)

        loot:addItem(cell1, invaderXim.drop_rate.VERY_COMMON)
        loot:addItem(cell1, invaderXim.drop_rate.VERY_COMMON)
        loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)
        loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)
        loot:addItem(cell3, invaderXim.drop_rate.VERY_COMMON)
        loot:addItem(cell3, invaderXim.drop_rate.VERY_COMMON)
    end)

    -- only appear on floor 1, and damage and delay are altered
    mob:addListener('AFTER_SPAWN', 'BIFRONS_AFTER_SPAWN', function(mobArg)
        mobArg:setDelay(330)
        mobArg:setMod(invaderXim.mod.ATT, 150)
        mobArg:setMod(invaderXim.mod.MAIN_DMG_RATING, -35)
        mobArg:setMod(invaderXim.mod.MATT, -57)
        mobArg:setMod(invaderXim.mod.INT, -20)
    end)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.salvage.spawnTempChest(mob)
    end
end

return entity
