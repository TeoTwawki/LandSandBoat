-----------------------------------
-- Area: Bastok Mines
--  NPC: Hemewmew
-- Type: Guildworker's Union Representative
-- !pos 117.970 1.017 -10.438 234
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildPointOnTrade(player, npc, trade, 207, invaderXim.guild.ALCHEMY)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildPointOnTrigger(player, 206, invaderXim.guild.ALCHEMY)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 206 then
        invaderXim.crafting.guildPointOnEventUpdate(player, option, npc, invaderXim.guild.ALCHEMY)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 206 then
        invaderXim.crafting.guildPointOnEventFinish(player, option, invaderXim.guild.ALCHEMY)
    elseif csid == 207 then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
