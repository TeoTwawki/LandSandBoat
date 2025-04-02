-----------------------------------
-- Brygid the Stylist
-----------------------------------
-- Log ID: 1, Quest ID: 44
-- Brygid : !pos -90 -4 -108 235
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.BRYGID_THE_STYLIST)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.BASTOK,
    item     = invaderXim.item.GLOVES,
    title    = invaderXim.title.BRYGID_APPROVED,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Brygid'] = quest:progressEvent(310),

            onEventFinish =
            {
                [310] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Brygid'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:getEquipID(invaderXim.slot.BODY) == invaderXim.item.ROBE and
                        player:getEquipID(invaderXim.slot.LEGS) == invaderXim.item.BRONZE_SUBLIGAR
                    then
                        return quest:progressEvent(311)
                    else
                        return quest:event(310)
                    end
                end,
            },

            onEventFinish =
            {
                [311] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
