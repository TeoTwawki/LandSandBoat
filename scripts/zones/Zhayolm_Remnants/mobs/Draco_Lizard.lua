-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Draco Lizard
-----------------------------------
local ID = zones[invaderXim.zone.ZHAYOLM_REMNANTS]
-----------------------------------

local equipCells =
{
    invaderXim.item.UNDULATUS_CELL,
    invaderXim.item.VIRGA_CELL,
    invaderXim.item.CUMULUS_CELL,
}

---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setDelay(300)
    -- dracos aggro sound, not sight
    mob:setMobMod(invaderXim.mobMod.DETECTION, invaderXim.detects.HEARING)
    mob:setMod(invaderXim.mod.ATT, 100)
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, -15)

    mob:addListener('ITEM_DROPS', 'LIZARD_ITEM_DROPS', function(mobArg, loot)
        local mobID      = mobArg:getID()
        local mobs       = utils.slice(ID.mob.DRACO_LIZARD, 9, 16)
        local extraDrops = { mobs[1], mobs[4], mobs[6], mobs[7] }

        if utils.contains(mobID, extraDrops) then
            -- 1st cell is handled in drop list
            local cellDrops = {}

            for i = 1, #equipCells do
                table.insert(cellDrops, equipCells[i])
            end

            local cell1 = invaderXim.item.CIRROCUMULUS_CELL
            local cell2 = table.remove(cellDrops, math.random(1, #cellDrops))
            local cell3 = table.remove(cellDrops, math.random(1, #cellDrops))
            local cell4 = table.remove(cellDrops, math.random(1, #cellDrops))
            loot:addItem(cell1, invaderXim.drop_rate.GUARANTEED)
            loot:addItem(cell1, invaderXim.drop_rate.GUARANTEED)
            loot:addItem(cell2, invaderXim.drop_rate.VERY_COMMON)
            loot:addItem(cell3, invaderXim.drop_rate.VERY_COMMON)
            loot:addItem(cell4, invaderXim.drop_rate.VERY_COMMON)
        end
    end)

    mob:addListener('TREASUREPOOL', 'LIZARD_ADDED_DROPS', function(mobArg, target, itemid)
        -- mob will always drop 2 of these cells, but only one of the cumulus
        local cells = { invaderXim.item.UNDULATUS_CELL, invaderXim.item.VIRGA_CELL }

        if utils.contains(itemid, cells) then
            target:addTreasure(itemid, mobArg)
        end
    end)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local instance = mob:getInstance()

        if instance then
            if invaderXim.salvage.groupKilled(instance, utils.slice(ID.mob.DRACO_LIZARD, 9, 16)) then
                local id = ID.mob.MAMOOL_JA_SAVANT[1]
                local stageBoss = GetMobByID(id, instance)

                if stageBoss and stageBoss:getLocalVar('spawned') == 0 then
                    SpawnMob(id, instance)
                    stageBoss:setLocalVar('spawned', 1)
                end
            end

            if invaderXim.salvage.groupKilled(instance, utils.slice(ID.mob.DRACO_LIZARD, 1, 8)) then
                local id = ID.mob.MAMOOL_JA_ZENIST[5]
                local stageBoss = GetMobByID(id, instance)
                if stageBoss and stageBoss:getLocalVar('spawned') == 0 then
                    SpawnMob(id, instance)
                    stageBoss:setLocalVar('spawned', 1)
                end
            end
        end
    end
end

return entity
