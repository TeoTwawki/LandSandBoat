-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Mamool Ja Savant
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
    mob:addListener('ITEM_DROPS', 'SAVANT_ITEM_DROPS', function(mobArg, loot)
        if mobArg:getID() == ID.mob.MAMOOL_JA_SAVANT[1] then
            local cellDrops = {}
            for i = 1, #equipCells do
                table.insert(cellDrops, equipCells[i])
            end

            local cell1 = invaderXim.item.CIRROCUMULUS_CELL
            local cell2 = table.remove(cellDrops, math.random(1, #cellDrops))
            local cell3 = table.remove(cellDrops, math.random(1, #cellDrops))
            local cell4 = table.remove(cellDrops, math.random(1, #cellDrops))
            loot:addItem(cell1, invaderXim.drop_rate.GUARANTEED)
            loot:addItem(cell2, invaderXim.drop_rate.GUARANTEED)
            loot:addItem(cell3, invaderXim.drop_rate.VERY_COMMON)
            loot:addItem(cell4, invaderXim.drop_rate.VERY_COMMON)
        end
    end)

    mob:addListener('TREASUREPOOL', 'SAVANT_ADDED_DROPS', function(mobArg, target, itemid)
        local cells =
        {
            invaderXim.item.CIRROCUMULUS_CELL,
            invaderXim.item.UNDULATUS_CELL,
            invaderXim.item.VIRGA_CELL,
            invaderXim.item.CUMULUS_CELL
        }

        if utils.contains(itemid, cells) then
            target:addTreasure(itemid, mobArg)
        end
    end)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        local instance = mob:getInstance()

        if instance then
            local stage    = instance:getStage()
            local progress = instance:getProgress()

            if stage == 2 then
                invaderXim.salvage.spawnTempChest(mob,
                {
                    rate = 1000,
                    itemID_1 = invaderXim.item.FLASK_OF_STRANGE_MILK,
                    itemAmount_1 = 10,
                })
                if progress == 1 then
                    instance:setLocalVar('stageComplete', 2)
                    GetNPCByID(ID.npc.SLOT, instance):setStatus(invaderXim.status.NORMAL)
                    invaderXim.salvage.unsealDoors(instance, { ID.npc.DOOR_2_1, ID.npc.DOOR_2_2, ID.npc.DOOR_2_3, ID.npc.DOOR_2_4 })
                    invaderXim.salvage.spawnGroup(instance, utils.slice(ID.mob.DRACO_LIZARD, 1, 8))
                    invaderXim.salvage.spawnGroup(instance, utils.slice(ID.mob.WYVERN, 9, 16))
                    invaderXim.salvage.spawnGroup(instance, utils.slice(ID.mob.WYVERN, 1, 8))
                    invaderXim.salvage.onDoorOpen(GetNPCByID(ID.npc.DOOR_2_1, instance), nil, 5)
                    invaderXim.salvage.onDoorOpen(GetNPCByID(ID.npc.DOOR_2_2, instance))
                    invaderXim.salvage.onDoorOpen(GetNPCByID(ID.npc.DOOR_2_3, instance))
                    invaderXim.salvage.onDoorOpen(GetNPCByID(ID.npc.DOOR_2_4, instance))
                end
            elseif stage == 3 then
                local group =
                {
                    utils.slice(ID.mob.MAMOOL_JA_SAVANT, 2, 11),
                    utils.slice(ID.mob.MAMOOL_JA_SOPHIST, 1, 10),
                    utils.slice(ID.mob.MAMOOL_JA_MIMICKER, 1, 12),
                    ID.mob.ARCHAIC_RAMPART[2]
                }

                if invaderXim.salvage.groupKilled(instance, group) then
                    local id       = ID.mob.POROGGO_MADAME[3]
                    local stageBoss = GetMobByID(id, instance)
                    if stageBoss and stageBoss:getLocalVar('spawned') == 0 then
                        SpawnMob(id, instance):setPos(300, -4, 526)
                        stageBoss:setDropID(3408)
                        stageBoss:setMaxHP(10150)
                        stageBoss:updateHealth()
                        stageBoss:setLocalVar('spawned', 1)
                    end
                end
            end
        end
    end
end

return entity
