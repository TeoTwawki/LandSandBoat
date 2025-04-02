-----------------------------------
-- Area: Metalworks
--  NPC: Lorena
-- Type: Blacksmithing Guildworker's Union Representative
-- !pos -104.990 1 30.995 237
-----------------------------------
local ID = zones[invaderXim.zone.METALWORKS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildPointOnTrade(player, npc, trade, 801, invaderXim.guild.SMITHING)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildPointOnTrigger(player, 800, invaderXim.guild.SMITHING)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 800 then
        invaderXim.crafting.guildPointOnEventUpdate(player, option, npc, invaderXim.guild.SMITHING)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 800 then
        invaderXim.crafting.guildPointOnEventFinish(player, option, invaderXim.guild.SMITHING)
    elseif csid == 801 then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
