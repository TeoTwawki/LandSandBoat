-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Yurim
-- !pos 83.697 -25.000 3.250 26
-----------------------------------
---@type TNpcEntity
local entity = {}

local nosTrades =
{
    [invaderXim.item.KARIN_OBI] =
    {
        hint = 1,
        base =
        {
            invaderXim.item.SILVER_OBI,
            invaderXim.item.RED_CHIP,
        },
        organs =
        {
            { invaderXim.item.PHUABO_ORGAN,              7 },
            { invaderXim.item.XZOMIT_ORGAN,              3 },
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 3 },
        },
    },

    [invaderXim.item.HYORIN_OBI] =
    {
        hint = 2,
        base =
        {
            invaderXim.item.SILVER_OBI,
            invaderXim.item.CLEAR_CHIP,
        },
        organs =
        {
            { invaderXim.item.XZOMIT_ORGAN,              7 },
            { invaderXim.item.PHUABO_ORGAN,              3 },
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 3 },
        },
    },

    [invaderXim.item.FURIN_OBI] =
    {
        hint = 3,
        base =
        {
            invaderXim.item.SILVER_OBI,
            invaderXim.item.GREEN_CHIP,
        },
        organs =
        {
            { invaderXim.item.AERN_ORGAN,                7 },
            { invaderXim.item.HPEMDE_ORGAN,              3 },
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 3 },
        },
    },

    [invaderXim.item.DORIN_OBI] =
    {
        hint = 4,
        base =
        {
            invaderXim.item.SILVER_OBI,
            invaderXim.item.YELLOW_CHIP,
        },
        organs =
        {
            { invaderXim.item.HPEMDE_ORGAN,              7 },
            { invaderXim.item.AERN_ORGAN,                3 },
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 3 },
        },
    },

    [invaderXim.item.RAIRIN_OBI] =
    {
        hint = 5,
        base =
        {
            invaderXim.item.SILVER_OBI,
            invaderXim.item.PURPLE_CHIP,
        },
        organs =
        {
            { invaderXim.item.PHUABO_ORGAN,              7 },
            { invaderXim.item.HPEMDE_ORGAN,              3 },
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 3 },
        },
    },

    [invaderXim.item.SUIRIN_OBI] =
    {
        hint = 6,
        base =
        {
            invaderXim.item.SILVER_OBI,
            invaderXim.item.BLUE_CHIP,
        },
        organs =
        {
            { invaderXim.item.HPEMDE_ORGAN,              7 },
            { invaderXim.item.PHUABO_ORGAN,              3 },
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 3 },
        },
    },

    [invaderXim.item.KORIN_OBI] =
    {
        hint = 7,
        base =
        {
            invaderXim.item.SILVER_OBI,
            invaderXim.item.WHITE_CHIP,
        },
        organs =
        {
            { invaderXim.item.XZOMIT_ORGAN,              7 },
            { invaderXim.item.AERN_ORGAN,                3 },
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 3 },
        },
    },

    [invaderXim.item.ANRIN_OBI] =
    {
        hint = 8,
        base =
        {
            invaderXim.item.SILVER_OBI,
            invaderXim.item.BLACK_CHIP,
        },
        organs =
        {
            { invaderXim.item.AERN_ORGAN,                7 },
            { invaderXim.item.XZOMIT_ORGAN,              3 },
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 3 },
        },
    },

    [invaderXim.item.FLAME_GORGET] =
    {
        hint = 9,
        base =
        {
            invaderXim.item.GORGET,
            invaderXim.item.RED_CHIP,
        },
        organs =
        {
            { invaderXim.item.PHUABO_ORGAN, 10 },
            { invaderXim.item.XZOMIT_ORGAN,  5 },
            { invaderXim.item.YOVRA_ORGAN,   1 },
        },
    },

    [invaderXim.item.SNOW_GORGET] =
    {
        hint = 10,
        base =
        {
            invaderXim.item.GORGET,
            invaderXim.item.CLEAR_CHIP,
        },
        organs =
        {
            { invaderXim.item.PHUABO_ORGAN, 10 },
            { invaderXim.item.AERN_ORGAN,    5 },
            { invaderXim.item.YOVRA_ORGAN,   1 },
        },
    },

    [invaderXim.item.BREEZE_GORGET] =
    {
        hint = 11,
        base =
        {
            invaderXim.item.GORGET,
            invaderXim.item.GREEN_CHIP,
        },
        organs =
        {
            { invaderXim.item.PHUABO_ORGAN, 10 },
            { invaderXim.item.HPEMDE_ORGAN,  5 },
            { invaderXim.item.YOVRA_ORGAN,   1 },
        },
    },

    [invaderXim.item.SOIL_GORGET] =
    {
        hint = 12,
        base =
        {
            invaderXim.item.GORGET,
            invaderXim.item.YELLOW_CHIP,
        },
        organs =
        {
            { invaderXim.item.XZOMIT_ORGAN, 10 },
            { invaderXim.item.AERN_ORGAN,    5 },
            { invaderXim.item.YOVRA_ORGAN,   1 },
        },
    },

    [invaderXim.item.THUNDER_GORGET] =
    {
        hint = 13,
        base =
        {
            invaderXim.item.GORGET,
            invaderXim.item.PURPLE_CHIP,
        },
        organs =
        {
            { invaderXim.item.XZOMIT_ORGAN, 10 },
            { invaderXim.item.HPEMDE_ORGAN,  5 },
            { invaderXim.item.YOVRA_ORGAN,   1 },
        },
    },

    [invaderXim.item.AQUA_GORGET]  =
    {
        hint = 14,
        base =
        {
            invaderXim.item.GORGET,
            invaderXim.item.BLUE_CHIP,
        },
        organs =
        {
            { invaderXim.item.AERN_ORGAN,   10 },
            { invaderXim.item.HPEMDE_ORGAN,  5 },
            { invaderXim.item.YOVRA_ORGAN,   1 },
        },
    },

    [invaderXim.item.LIGHT_GORGET] =
    {
        hint = 15,
        base =
        {
            invaderXim.item.GORGET,
            invaderXim.item.WHITE_CHIP,
        },
        organs =
        {
            { invaderXim.item.AERN_ORGAN,   7 },
            { invaderXim.item.PHUABO_ORGAN, 3 },
            { invaderXim.item.HPEMDE_ORGAN, 3 },
            { invaderXim.item.YOVRA_ORGAN,  2 },
        },
    },

    [invaderXim.item.SHADOW_GORGET] =
    {
        hint = 16,
        base =
        {
            invaderXim.item.GORGET,
            invaderXim.item.BLACK_CHIP,
        },
        organs =
        {
            { invaderXim.item.HPEMDE_ORGAN, 7 },
            { invaderXim.item.PHUABO_ORGAN, 3 },
            { invaderXim.item.AERN_ORGAN,   3 },
            { invaderXim.item.YOVRA_ORGAN,  2 },
        },
    },

    [invaderXim.item.SANATIVE_EARRING] =
    {
        hint = 17,
        base =
        {
            invaderXim.item.SILVER_EARRING,
            invaderXim.item.WHITE_CHIP,
        },
        organs =
        {
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 5 },
            { invaderXim.item.EUVHI_ORGAN,               5 },
        },
    },

    [invaderXim.item.RELAXING_EARRING] =
    {
        hint = 17,
        base =
        {
            invaderXim.item.SILVER_EARRING,
            invaderXim.item.BLACK_CHIP,
        },
        organs =
        {
            { invaderXim.item.SAMPLE_OF_LUMINIAN_TISSUE, 5 },
            { invaderXim.item.EUVHI_ORGAN,               5 },
        },
    },
}

entity.onTrade = function(player, npc, trade)
    local nameOfScience  = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE)
    local itemInProgress = player:getCharVar('NAME_OF_SCIENCE_target')

    if
        itemInProgress > 0 and
        npcUtil.tradeHas(trade, nosTrades[itemInProgress].organs)
    then
        player:startEvent(529, invaderXim.item.GORGET, invaderXim.item.SILVER_EARRING, invaderXim.item.SILVER_OBI)
    elseif
        (nameOfScience == invaderXim.questStatus.QUEST_ACCEPTED or nameOfScience == invaderXim.questStatus.QUEST_COMPLETED) and
        npcUtil.tradeHas(trade, invaderXim.item.APPLE_PIE) and
        itemInProgress > 0
    then
        -- apple pie hint
        player:startEvent(531, invaderXim.item.APPLE_PIE, 0, nosTrades[itemInProgress].hint)
    elseif
        (nameOfScience == invaderXim.questStatus.QUEST_ACCEPTED or nameOfScience == invaderXim.questStatus.QUEST_COMPLETED) and
        itemInProgress == 0
    then
        for k, v in pairs(nosTrades) do
            if npcUtil.tradeHas(trade, v.base) then
                player:setCharVar('NAME_OF_SCIENCE_target', k)
                player:startEvent(526, unpack(v.base))
                break
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    -- IN THE NAME OF SCIENCE
    if player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_WARRIORS_PATH) then
        local nameOfScience  = player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE)
        local itemInProgress = player:getCharVar('NAME_OF_SCIENCE_target')

        if nameOfScience == invaderXim.questStatus.QUEST_AVAILABLE then
            player:startEvent(524, invaderXim.item.SILVER_OBI, invaderXim.item.SILVER_EARRING, invaderXim.item.GORGET)
        elseif
            (nameOfScience == invaderXim.questStatus.QUEST_ACCEPTED or nameOfScience == invaderXim.questStatus.QUEST_COMPLETED) and
            itemInProgress == 0
        then
            player:startEvent(525, invaderXim.item.SILVER_OBI, invaderXim.item.SILVER_EARRING, invaderXim.item.GORGET)
        elseif
            nameOfScience == invaderXim.questStatus.QUEST_ACCEPTED or
            nameOfScience == invaderXim.questStatus.QUEST_COMPLETED
        then
            if math.random(1, 100) <= 30 then
                player:startEvent(532, unpack(nosTrades[itemInProgress].base))
            else
                player:startEvent(528, unpack(nosTrades[itemInProgress].base))
            end
        end

    -- STANDARD DIALOG
    -- TODO: This is not a true default action, and needs to be verified for when this begins to be displayed
    -- else
    --    player:startEvent(519)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 524 then
        player:addQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE)
    elseif csid == 531 then
        player:confirmTrade()
    elseif csid == 526 then
        player:confirmTrade()
    elseif csid == 529 then
        local itemInProgress = player:getCharVar('NAME_OF_SCIENCE_target')
        if npcUtil.completeQuest(player, invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE, { item = itemInProgress, var = { 'NAME_OF_SCIENCE_target' } }) then
            player:confirmTrade()
        end
    end
end

return entity
