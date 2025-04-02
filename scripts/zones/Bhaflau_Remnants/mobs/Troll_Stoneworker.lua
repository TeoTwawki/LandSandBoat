-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Troll Stoneworker
-----------------------------------
local ID = zones[invaderXim.zone.BHAFLAU_REMNANTS]
-----------------------------------

---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addListener('ITEM_DROPS', 'STONEWORKER_ITEM_DROPS', function(mobArg, loot)
        local instance = mob:getInstance()

        if instance then
            local floor = instance:getStage()

            if floor == 1 then
                local cell1, cell2, cell3 = invaderXim.zoneUtil.pickList(mobArg)
                loot:addItem(cell1, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell1, invaderXim.drop_rate.VERY_COMMON)

                loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)

                loot:addItem(cell3, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell3, invaderXim.drop_rate.VERY_COMMON)
            else
                local cell1, cell2, cell3, cell4 = invaderXim.zoneUtil.pickList(mobArg)
                local mobID = mobArg:getID()
                if utils.contains(mobID, utils.slice(ID.mob.TROLL_STONEWORKER, 10, 13)) then
                    loot:addItem(invaderXim.item.INCUS_CELL, invaderXim.drop_rate.VERY_COMMON)
                end

                loot:addItem(cell1, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell1, invaderXim.drop_rate.VERY_COMMON)

                loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)

                loot:addItem(cell3, invaderXim.drop_rate.GUARANTEED)
                loot:addItem(cell3, invaderXim.drop_rate.GUARANTEED)
                loot:addItem(cell3, invaderXim.drop_rate.GUARANTEED)

                loot:addItem(cell4, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell4, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell4, invaderXim.drop_rate.VERY_COMMON)
            end
        end
    end)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.salvage.spawnTempChest(mob)
    end
end

return entity
