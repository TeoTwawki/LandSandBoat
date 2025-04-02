-----------------------------------
-- Area: Windurst Woods
--  NPC: Meriri
-- Guild Merchant NPC: Clothcrafting Guild
-- !pos -76.471 -3.55 -128.341 241
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local guildSkillId = invaderXim.skill.CLOTHCRAFT
    local stock = invaderXim.shop.generalGuildStock[guildSkillId]
    invaderXim.shop.generalGuild(player, stock, guildSkillId)
    player:showText(npc, ID.text.MERIRI_DIALOG)
end

return entity
