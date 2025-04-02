-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Meret
-- !pos 83.166 -25.082 4.633 26
-----------------------------------
---@type TNpcEntity
local entity = {}

-- [tradedItemId] = rewardItemId
local trades =
{
    [invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE] = invaderXim.item.VIRTUE_STONE_POUCH,
    [invaderXim.item.PHUABO_ORGAN]              = invaderXim.item.VIRTUE_STONE_POUCH,
    [invaderXim.item.XZOMIT_ORGAN]              = invaderXim.item.VIRTUE_STONE_POUCH,
    [invaderXim.item.AERN_ORGAN]                = invaderXim.item.VIRTUE_STONE_POUCH,
    [invaderXim.item.HPEMDE_ORGAN]              = invaderXim.item.VIRTUE_STONE_POUCH,
    [invaderXim.item.YOVRA_ORGAN]               = invaderXim.item.VIRTUE_STONE_POUCH,
    [invaderXim.item.EUVHI_ORGAN]               = invaderXim.item.VIRTUE_STONE_POUCH,
    [invaderXim.item.LUMINION_CHIP]             = invaderXim.item.VIRTUE_STONE_POUCH,
    [invaderXim.item.VICE_OF_ANTIPATHY]         = invaderXim.item.MERCIFUL_CAPE,
    [invaderXim.item.VICE_OF_AVARICE]           = invaderXim.item.ALTRUISTIC_CAPE,
    [invaderXim.item.VICE_OF_ASPERSION]         = invaderXim.item.ASTUTE_CAPE,
    [invaderXim.item.AURA_OF_ADULATION]         = invaderXim.item.NOVIO_EARRING,
    [invaderXim.item.AURA_OF_VORACITY]          = invaderXim.item.NOVIA_EARRING,
    [invaderXim.item.SIN_OF_INDIGNATION]        = invaderXim.item.NINURTAS_SASH,
    [invaderXim.item.SIN_OF_INDOLENCE]          = invaderXim.item.AUREOLE,
    [invaderXim.item.SIN_OF_INDULGENCE]         = invaderXim.item.FUTSUNO_MITAMA,
    [invaderXim.item.SIN_OF_INVIDIOUSNESS]      = invaderXim.item.RAPHAELS_ROD,
    [invaderXim.item.SIN_OF_INSOLENCE]          = invaderXim.item.MARSS_RING,
    [invaderXim.item.SIN_OF_INFATUATION]        = invaderXim.item.BELLONAS_RING,
    [invaderXim.item.SIN_OF_INTEMPERANCE]       = invaderXim.item.MINERVAS_RING,
}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE) == invaderXim.questStatus.QUEST_COMPLETED then
        for k, v in pairs(trades) do
            if npcUtil.tradeHasExactly(trade, k) then
                player:setLocalVar('meretReward', v)
                player:startEvent(586, k, v)
                break
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(invaderXim.mission.log_id.COP) > invaderXim.mission.id.cop.THE_WARRIORS_PATH then
        if player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE) == invaderXim.questStatus.QUEST_COMPLETED then
            if math.random(1, 100) <= 50 then
                player:startEvent(582)
            else
                player:startEvent(583)
            end
        else
            player:startEvent(585)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 586 and option == player:getLocalVar('meretReward') then
        player:setLocalVar('meretReward', 0)

        if npcUtil.giveItem(player, option) then
            player:confirmTrade()
        end
    end
end

return entity
