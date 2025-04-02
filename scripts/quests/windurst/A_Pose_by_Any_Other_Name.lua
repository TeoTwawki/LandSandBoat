-----------------------------------
-- A Pose By Any Other Name
-- Angelica !pos -64 -9.25 -9 238
-----------------------------------

local quest = Quest:new(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.A_POSE_BY_ANY_OTHER_NAME)

local poseItems =
{
    [invaderXim.job.WAR] = invaderXim.item.BRONZE_HARNESS,
    [invaderXim.job.MNK] = invaderXim.item.ROBE,
    [invaderXim.job.WHM] = invaderXim.item.TUNIC,
    [invaderXim.job.BLM] = invaderXim.item.TUNIC,
    [invaderXim.job.RDM] = invaderXim.item.TUNIC,
    [invaderXim.job.THF] = invaderXim.item.LEATHER_VEST,
    [invaderXim.job.PLD] = invaderXim.item.BRONZE_HARNESS,
    [invaderXim.job.DRK] = invaderXim.item.BRONZE_HARNESS,
    [invaderXim.job.BST] = invaderXim.item.LEATHER_VEST,
    [invaderXim.job.BRD] = invaderXim.item.ROBE,
    [invaderXim.job.RNG] = invaderXim.item.LEATHER_VEST,
    [invaderXim.job.SAM] = invaderXim.item.KENPOGI,
    [invaderXim.job.NIN] = invaderXim.item.KENPOGI,
    [invaderXim.job.DRG] = invaderXim.item.BRONZE_HARNESS,
    [invaderXim.job.SMN] = invaderXim.item.TUNIC,
    [invaderXim.job.BLU] = invaderXim.item.ROBE,
    [invaderXim.job.COR] = invaderXim.item.BRONZE_HARNESS,
    [invaderXim.job.PUP] = invaderXim.item.TUNIC,
    [invaderXim.job.DNC] = invaderXim.item.LEATHER_VEST,
    [invaderXim.job.SCH] = invaderXim.item.TUNIC,
    [invaderXim.job.GEO] = invaderXim.item.TUNIC,
    [invaderXim.job.RUN] = invaderXim.item.BRONZE_HARNESS,
}

quest.reward =
{
    fame = 75,
    fameArea = invaderXim.fameArea.WINDURST,
    item = invaderXim.item.COPY_OF_ANCIENT_BLOOD,
    title = invaderXim.title.SUPER_MODEL,
    keyItem = invaderXim.ki.ANGELICAS_AUTOGRAPH,
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and player:needToZone() == false
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Angelica'] =
            {
                onTrigger = function(player, npc)
                    local desiredBody = poseItems[player:getMainJob()]
                    local currentBody = player:getEquipID(invaderXim.slot.BODY)
                    if currentBody ~= desiredBody then
                        if quest:getVar(player, 'Prog') == 1 then
                            return quest:progressEvent(90)
                        else
                            return quest:progressEvent(87)
                        end
                    else
                        -- default dialogs
                        local rand = math.random(1, 3)
                        if rand == 1 then
                            player:startEvent(86)
                        elseif rand == 2 then
                            player:startEvent(88)
                        else
                            player:startEvent(89)
                        end
                    end
                end
            },

            onEventFinish =
            {
                [87] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,

                [90] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                        quest:setVar(player, 'Prog', 0)
                    end
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog == 0
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Angelica'] =
            {
                onTrigger = function(player, npc)
                    local requestedBody = poseItems[player:getMainJob()]

                    quest:setVar(player, 'Stage', os.time() + 300)
                    quest:setVar(player, 'Prog', requestedBody)

                    return quest:progressEvent(92, 0, 0, 0, requestedBody)
                end,
            },
        },
    },

    -- Section: Finish quest
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and vars.Prog ~= 0
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Angelica'] =
            {
                onTrigger = function(player, npc)
                    local requestedBody = quest:getVar(player, 'Prog')
                    if quest:getVar(player, 'Stage') >= os.time() then -- Under time. Quest completed.
                        if player:getEquipID(invaderXim.slot.BODY) == requestedBody then
                            return quest:progressEvent(96)
                        else
                            return quest:progressEvent(93, 0, 0, 0, requestedBody)
                        end
                    else -- Over time. Quest failed.
                        return quest:progressEvent(102)
                    end
                end,
            },

            onEventFinish =
            {
                [96] = function(player, csid, option, npc) -- Quest completed
                    quest:complete(player)
                end,

                [102] = function(player, csid, option, npc) -- Quest failed.
                    player:delQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.A_POSE_BY_ANY_OTHER_NAME)
                    quest:setVar(player, 'Prog', 0) -- TODO: Confirm that initial CS has to be repeated aswell upon quest failure. If not, set var to 1 here.
                    quest:setVar(player, 'Stage', 0)
                    player:addTitle(invaderXim.title.LOWER_THAN_THE_LOWEST_TUNNEL_WORM)
                    player:needToZone(true)
                end,
            },
        },
    },

    -- Section: Quest Completed
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.WINDURST_WATERS] =
        {
            ['Angelica'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(101):replaceDefault()
                end,
            },
        },
    },
}

return quest
