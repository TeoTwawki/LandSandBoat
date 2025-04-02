-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 3rd Floor North to Central
-- !pos -340 -2 -320, 17084917
-----------------------------------
local ID = zones[invaderXim.zone.BHAFLAU_REMNANTS]
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if npc:getLocalVar('unSealed') == 1 then
        player:startEvent(300)
    else
        player:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        local instance = npc:getInstance()

        if instance and invaderXim.salvage.onDoorOpen(npc) then
            invaderXim.salvage.unsealDoors(instance, { ID.npc.DOOR_3_EAST_IXIMT, ID.npc.DOOR_3_WEST_IXIMT })
            local mobs =
            {
                utils.slice(ID.mob.ARCHAIC_GEARS, 1, 2),
                utils.slice(ID.mob.ARCHAIC_GEAR, 1, 16),
            }
            invaderXim.salvage.spawnGroup(instance, mobs)
            GetNPCByID(ID.npc.SLOT, instance):setStatus(invaderXim.status.NORMAL)
        else
            player:messageSpecial(ID.text.DOOR_IS_SEALED)
        end
    end
end

return entity
