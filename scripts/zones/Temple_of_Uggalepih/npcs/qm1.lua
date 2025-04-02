-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: ??? (Tonberry Rattle ITEM)
-- !pos 269 0 91 159
-----------------------------------
local ID = zones[invaderXim.zone.TEMPLE_OF_UGGALEPIH]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if not player:hasItem(invaderXim.item.TONBERRY_RATTLE) then
        if npcUtil.giveItem(player, invaderXim.item.TONBERRY_RATTLE) then -- Tonberry Rattle
            npc:setStatus(invaderXim.status.DISAPPEAR)
            npc:updateNPCHideTime(7200) -- 2 hours
            -- TODO: ??? reappears at new position
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

return entity
