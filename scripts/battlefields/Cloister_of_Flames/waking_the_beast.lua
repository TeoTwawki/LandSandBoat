-----------------------------------
-- Area: Cloister of Flames
-- BCNM: Waking the Beast
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_FLAMES,
    battlefieldId    = invaderXim.battlefield.id.WAKING_THE_BEAST_CLOISTER_OF_FLAMES,
    canLoseExp       = false,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 2,
    entryNpc         = 'FP_Entrance',
    exitNpc          = 'Fire_Protocrystal',
    requiredKeyItems = { invaderXim.ki.RAINBOW_RESONATOR },

    questArea = invaderXim.questLog.OTHER_AREAS,
    quest     = invaderXim.quest.id.otherAreas.WAKING_THE_BEAST,
})

function content:onEventFinishWin(player, csid, option, npc)
    npcUtil.giveKeyItem(player, invaderXim.ki.EYE_OF_FLAMES)
end

content.groups =
{
    {
        mobs = { 'Ifrit_Prime_WTB' },
        allDeath = function(battlefield, mob)
            -- when avatar defeated then all elementals should also die
            for i = 1, 4 do
                local elemental = GetMobByID(mob:getID() + i)
                if elemental and elemental:isAlive() then
                    elemental:setHP(0)
                end
            end

            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },

    {
        mobs =
        {
            'Ifrit_Prime_WTB',
            'Fire_Elemental',
        },
        isParty   = true,
        superlink = true,
    },
}

return content:register()
