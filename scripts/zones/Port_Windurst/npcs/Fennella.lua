-----------------------------------
-- Area: Port Windurst
--  NPC: Fennella
-- Type: Guildworker's Union Representative
-- !pos -177.811 -2.835 65.639 240
-----------------------------------
local ID = zones[invaderXim.zone.PORT_WINDURST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildPointOnTrade(player, npc, trade, 10021, invaderXim.guild.FISHING)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildPointOnTrigger(player, 10020, invaderXim.guild.FISHING)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 10020 then
        invaderXim.crafting.guildPointOnEventUpdate(player, option, npc, invaderXim.guild.FISHING)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 10020 then
        invaderXim.crafting.guildPointOnEventFinish(player, option, invaderXim.guild.FISHING)
    elseif csid == 10021 then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
