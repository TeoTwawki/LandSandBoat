-----------------------------------
-- Martial Mastery
-----------------------------------
-- !addquest 3 167
-- Nomad Moogle : !pos 10.012 1.453 121.883 243
-----------------------------------
local ruLudeID = zones[invaderXim.zone.RULUDE_GARDENS]
-----------------------------------

local quest = Quest:new(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.MARTIAL_MASTERY)

quest.reward =
{
    keyItem = invaderXim.ki.HEART_OF_THE_BUSHIN,
    title = invaderXim.title.BUSHIN_RYU_INHERITOR,
}

local validCombatSkills =
{
    invaderXim.skill.HAND_TO_HAND,
    invaderXim.skill.DAGGER,
    invaderXim.skill.SWORD,
    invaderXim.skill.GREAT_SWORD,
    invaderXim.skill.AXE,
    invaderXim.skill.GREAT_AXE,
    invaderXim.skill.SCYTHE,
    invaderXim.skill.POLEARM,
    invaderXim.skill.KATANA,
    invaderXim.skill.GREAT_KATANA,
    invaderXim.skill.CLUB,
    invaderXim.skill.STAFF,
    invaderXim.skill.ARCHERY,
    invaderXim.skill.MARKSMANSHIP,
}

local function hasRequiredCombatSkill(player)
    for _, v in ipairs(validCombatSkills) do
        if player:getSkillLevel(v) >= 357 then
            return true
        end
    end

    return false
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getMainLvl() >= 96 and
                hasRequiredCombatSkill(player)
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Nomad_Moogle'] = quest:progressEvent(10196),

            onEventFinish =
            {
                [10196] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            -- TODO: Confirm that the player must be on a valid job to complete
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                player:getMainLvl() >= 96 and
                hasRequiredCombatSkill(player) and
                player:getMeritCount() >= 15
        end,

        [invaderXim.zone.RULUDE_GARDENS] =
        {
            ['Nomad_Moogle'] = quest:progressEvent(10198),

            onEventFinish =
            {
                [10198] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:setMerits(player:getMeritCount() - 15)
                        player:messageSpecial(ruLudeID.text.LEARNED_SECRET_TECHNIQUE)
                    end
                end,
            },
        },
    },
}

return quest
