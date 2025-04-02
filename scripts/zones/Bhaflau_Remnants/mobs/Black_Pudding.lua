-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Black Pudding
-----------------------------------
local ID = zones[invaderXim.zone.BHAFLAU_REMNANTS]
require('scripts/zones/Bhaflau_Remnants/globals/zoneUtil')
-----------------------------------

---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    local instance = mob:getInstance()

    if instance then
        local mobID = mob:getID()

        if utils.contains(mobID, utils.slice(ID.mob.BLACK_PUDDING, 25, 34)) then -- central from south west
            mob:setAnimationSub(5)
            mob:setMod(invaderXim.mod.DMGMAGIC, -325)
            mob:setMod(invaderXim.mod.DMGBREATH, -32)
        elseif utils.contains(mobID, utils.slice(ID.mob.BLACK_PUDDING, 15, 24)) then
            mob:setAnimationSub(6)
            mob:setMod(invaderXim.mod.DMGPHYS, -50)
            mob:setMod(invaderXim.mod.DMGRANGE, -50)
        else
            mob:setMod(invaderXim.mod.DMGMAGIC, -500)
            mob:setMod(invaderXim.mod.DMGBREATH, -50)
        end

        mob:addListener('ITEM_DROPS', 'PUDDING_ITEM_DROPS', function(mobArg, loot)
            local cell1, cell2, cell3 = invaderXim.zoneUtil.pickList(mobArg)
            local id = mobArg:getID()

            if utils.contains(id, utils.slice(ID.mob.BLACK_PUDDING, 15, 34)) then
                loot:addItem(cell1, invaderXim.drop_rate.GUARANTEED)

                loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)

                loot:addItem(cell3, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell3, invaderXim.drop_rate.VERY_COMMON)
            else
                loot:addItem(cell1, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell1, invaderXim.drop_rate.VERY_COMMON)

                loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)
                loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)

                loot:addItem(cell3, invaderXim.drop_rate.GUARANTEED)
                loot:addItem(cell3, invaderXim.drop_rate.GUARANTEED)
                loot:addItem(cell3, invaderXim.drop_rate.GUARANTEED)

                if utils.contains(id, utils.slice(ID.mob.BLACK_PUDDING, 1, 7)) then -- Southeast
                    loot:addItem(invaderXim.item.INCUS_CELL, invaderXim.drop_rate.VERY_COMMON)
                    loot:addItem(invaderXim.item.INCUS_CELL, invaderXim.drop_rate.VERY_COMMON)
                end
            end
        end)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.salvage.spawnTempChest(mob)
    end
end

return entity
