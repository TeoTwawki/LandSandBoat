-----------------------------------
-- Area: Arrapago Reef
-- Door: Iron Gate (Lamian Fang Key)
-- !pos 580 -17 120
-----------------------------------
local ID = zones[invaderXim.zone.ARRAPAGO_REEF]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npc:getAnimation() == invaderXim.anim.CLOSE_DOOR then
        if npcUtil.tradeHas(trade, invaderXim.item.LAMIAN_FANG_KEY) then
            npc:openDoor()
            player:messageSpecial(ID.text.KEY_BREAKS, invaderXim.item.LAMIAN_FANG_KEY)
            player:tradeComplete()
        elseif
            npcUtil.tradeHas(trade, invaderXim.item.SET_OF_THIEFS_TOOLS) and
            player:getMainJob() == invaderXim.job.THF
        then
            if math.random(1, 2) == 1 then -- TODO: figure out actual percentage chance to pick locks; 50% for now
                player:messageSpecial(ID.text.LOCK_SUCCESS, invaderXim.item.SET_OF_THIEFS_TOOLS)
                npc:openDoor()
            else
                player:messageSpecial(ID.text.LOCK_FAIL, invaderXim.item.SET_OF_THIEFS_TOOLS)
            end

            player:confirmTrade()
        elseif
            npcUtil.tradeHas(trade, invaderXim.item.LIVING_KEY) and
            player:getMainJob() == invaderXim.job.THF
        then
            if math.random(1, 2) == 1 then -- TODO: figure out actual percentage chance to pick locks; 50% for now
                player:messageSpecial(ID.text.LOCK_SUCCESS, invaderXim.item.LIVING_KEY)
                npc:openDoor()
            else
                player:messageSpecial(ID.text.LOCK_FAIL, invaderXim.item.LIVING_KEY)
            end

            player:confirmTrade()
        elseif
            npcUtil.tradeHas(trade, invaderXim.item.SKELETON_KEY) and
            player:getMainJob() == invaderXim.job.THF
        then
            if math.random(1, 2) == 1 then -- TODO: figure out actual percentage chance to pick locks; 50% for now
                player:messageSpecial(ID.text.LOCK_SUCCESS, invaderXim.item.SKELETON_KEY)
                npc:openDoor()
            else
                player:messageSpecial(ID.text.LOCK_FAIL, invaderXim.item.SKELETON_KEY)
            end

            player:confirmTrade()
        end
    end
end

entity.onTrigger = function(player, npc)
    if player:getZPos() < 120 and npc:getAnimation() == invaderXim.anim.CLOSE_DOOR then
        if player:getMainJob() == invaderXim.job.THF then
            player:messageSpecial(ID.text.DOOR_IS_LOCKED2, invaderXim.item.LAMIAN_FANG_KEY, invaderXim.item.SET_OF_THIEFS_TOOLS) -- message only THF's get
        else
            player:messageSpecial(ID.text.DOOR_IS_LOCKED, invaderXim.item.LAMIAN_FANG_KEY)
        end
    elseif player:getZPos() >= 120 and npc:getAnimation() == invaderXim.anim.CLOSE_DOOR then
        player:messageSpecial(ID.text.YOU_UNLOCK_DOOR) -- message from 'inside' of door
        npc:openDoor()
    end
end

return entity
