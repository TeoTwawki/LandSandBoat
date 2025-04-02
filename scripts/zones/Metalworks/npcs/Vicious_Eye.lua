-----------------------------------
-- Area: Metalworks
--  NPC: Vicious Eye
-- Type: Guild Merchant (Blacksmithing Guild)
-- !pos -106.132 0.999 -28.757 237
-----------------------------------
local ID = zones[invaderXim.zone.METALWORKS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local guildSkillId = invaderXim.skill.SMITHING
    local stock = invaderXim.shop.generalGuildStock[guildSkillId]
    invaderXim.shop.generalGuild(player, stock, guildSkillId)
    player:showText(npc, ID.text.VICIOUS_EYE_SHOP_DIALOG)
end

return entity
