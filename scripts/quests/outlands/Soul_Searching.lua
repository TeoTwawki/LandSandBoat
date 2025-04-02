-----------------------------------
-- Soul Searching
-----------------------------------
-- Log ID: 5, Quest ID: 162
-- Cermet Headstone : !pos 235 0 280 121
-----------------------------------
local zitahID = zones[invaderXim.zone.THE_SANCTUARY_OF_ZITAH]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.SOUL_SEARCHING)

quest.reward =
{
    item  = invaderXim.item.BAT_EARRING,
    title = invaderXim.title.GUIDER_OF_SOULS_TO_THE_SANCTUARY,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.THE_SANCTUARY_OF_ZITAH] =
        {
            ['Cermet_Headstone'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(invaderXim.ki.PRISMATIC_FRAGMENT) then
                        return quest:progressEvent(202, invaderXim.ki.PRISMATIC_FRAGMENT)
                    else
                        return quest:messageSpecial(zitahID.text.AIR_REMAINS_STAGNANT)
                    end
                end,
            },

            onEventFinish =
            {
                [202] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
