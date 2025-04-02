-----------------------------------
-- Area: Windurst Woods
--  NPC: Retto-Marutto
-- Guild Merchant NPC: Bonecrafting Guild
-- !pos -6.142 -6.55 -132.639 241
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local guildSkillId = invaderXim.skill.BONECRAFT
    local stock = invaderXim.shop.generalGuildStock[guildSkillId]
    invaderXim.shop.generalGuild(player, stock, guildSkillId)
    player:showText(npc, ID.text.RETTO_MARUTTO_DIALOG)
end

return entity
