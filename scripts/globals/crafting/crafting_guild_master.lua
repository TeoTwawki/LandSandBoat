-----------------------------------
-- Guild Masters
-----------------------------------
require('scripts/globals/crafting/crafting_utils')
require('scripts/globals/npc_util')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.crafting = invaderXim.crafting or {}

-----------------------------------
-- Data
-----------------------------------
local lastRank = invaderXim.craftRank.EXPERT

local npcTable =
{
    ['Thubu_Parohren'] = { 10009, invaderXim.guild.FISHING,      invaderXim.skill.FISHING,      invaderXim.item.WATER_CRYSTAL, invaderXim.ki.ANGLERS_ALMANAC,       '[Expert]Fishing'      },
    ['Cheupirudaux'  ] = {   621, invaderXim.guild.WOODWORKING,  invaderXim.skill.WOODWORKING,  invaderXim.item.WIND_CRYSTAL,  invaderXim.ki.WAY_OF_THE_CARPENTER,  '[Expert]Woodworking'  },
    ['Ghemp'         ] = {   101, invaderXim.guild.SMITHING,     invaderXim.skill.SMITHING,     invaderXim.item.FIRE_CRYSTAL,  invaderXim.ki.WAY_OF_THE_BLACKSMITH, '[Expert]Smithing'     },
    ['Mevreauche'    ] = {   626, invaderXim.guild.SMITHING,     invaderXim.skill.SMITHING,     invaderXim.item.FIRE_CRYSTAL,  invaderXim.ki.WAY_OF_THE_BLACKSMITH, '[Expert]Smithing'     },
    ['Reinberta'     ] = {   300, invaderXim.guild.GOLDSMITHING, invaderXim.skill.GOLDSMITHING, invaderXim.item.FIRE_CRYSTAL,  invaderXim.ki.WAY_OF_THE_GOLDSMITH,  '[Expert]Goldsmithing' },
    ['Ponono'        ] = { 10011, invaderXim.guild.CLOTHCRAFT,   invaderXim.skill.CLOTHCRAFT,   invaderXim.item.EARTH_CRYSTAL, invaderXim.ki.WAY_OF_THE_WEAVER,     '[Expert]Clothcraft'   },
    ['Faulpie'       ] = {   648, invaderXim.guild.LEATHERCRAFT, invaderXim.skill.LEATHERCRAFT, invaderXim.item.DARK_CRYSTAL,  invaderXim.ki.WAY_OF_THE_TANNER,     '[Expert]Leathercraft' },
    ['Peshi_Yohnts'  ] = { 10016, invaderXim.guild.BONECRAFT,    invaderXim.skill.BONECRAFT,    invaderXim.item.WIND_CRYSTAL,  invaderXim.ki.WAY_OF_THE_BONEWORKER, '[Expert]Bonecraft'    },
    ['Abd-al-Raziq'  ] = {   120, invaderXim.guild.ALCHEMY,      invaderXim.skill.ALCHEMY,      invaderXim.item.WATER_CRYSTAL, invaderXim.ki.WAY_OF_THE_ALCHEMIST,  '[Expert]Alchemy'      },
    ['Piketo-Puketo' ] = { 10013, invaderXim.guild.COOKING,      invaderXim.skill.COOKING,      invaderXim.item.FIRE_CRYSTAL,  invaderXim.ki.WAY_OF_THE_CULINARIAN, '[Expert]Cooking'      },
}

-- TODO: Enum this items. This PR is already massive.
local testItemTable =
{
    [invaderXim.guild.FISHING     ] = {  4401,  4379,  4469,  4480,  4462,  4479,  4471,  4478,  4474,  5817 },
    [invaderXim.guild.WOODWORKING ] = {    22,    23, 17354, 17348, 17053, 17156, 17054,    56, 17101, 18884 },
    [invaderXim.guild.SMITHING    ] = { 16530, 12299, 16512, 16650, 16651, 16559, 12427, 16577, 12428, 19788 },
    [invaderXim.guild.GOLDSMITHING] = { 12496, 12497, 12495, 13082, 13446, 13084, 12545, 13125, 16515, 11060 },
    [invaderXim.guild.CLOTHCRAFT  ] = { 13583, 13584, 13204, 13075, 12723, 13586, 13752, 12612, 14253, 11000 },
    [invaderXim.guild.LEATHERCRAFT] = { 13594, 16386, 13588, 13195, 12571, 12572, 12980, 12702, 12447, 10577 },
    [invaderXim.guild.BONECRAFT   ] = { 13442, 13441, 13323, 13459, 13091, 17299, 16420, 12508, 13987, 11058 },
    [invaderXim.guild.ALCHEMY     ] = {   937,  4157,  4163,   947, 16543,  4116, 16479,  4120, 16609, 10792 },
    [invaderXim.guild.COOKING     ] = {  4355,  4416,  4489,  4381,  4413,  4558,  4546,  4440,  4561,  5930 },
}

local function giveNewRank(player, skillId, newRank)
    -- Raise rank.
    player:setSkillRank(skillId, newRank)

    -- Set local var to complete trade after event.
    player:setLocalVar('CompleteTrade', 1)
end

-----------------------------------
-- NPC Functions
-----------------------------------
invaderXim.crafting.guildMasterOnTrade = function(player, npc, trade)
    local npcName = npc:getName()
    local eventId = npcTable[npcName][1] + 1 -- Trade event = Trigger event + 1
    local guildId = npcTable[npcName][2]
    local skillId = npcTable[npcName][3]

    -- Get test item and new rank.
    local newRank    = player:getSkillRank(skillId) + 1
    local testItem   = 0
    local skillLevel = invaderXim.crafting.getRealSkill(player, skillId)
    local skillCap   = invaderXim.crafting.getCraftSkillCap(player, skillId)

    if
        skillLevel >= skillCap - 2 and
        newRank <= lastRank
    then
        testItem = testItemTable[guildId][newRank]
    end

    -- Check trade.
    if
        testItem ~= 0 and
        trade:hasItemQty(testItem, 1) and
        trade:getItemCount() == 1
    then
        -- Expert quest.
        if
            newRank == invaderXim.craftRank.EXPERT and           -- Check if new rank is the last one. (Tied to mini-quest)
            player:hasKeyItem(npcTable[npcName][5]) and  -- Check if player has appropiate Key Item.
            player:getCharVar(npcTable[npcName][6]) == 2 -- Check if player has gotten quest dialog.
        then
            if
                (guildId ~= invaderXim.guild.FISHING and trade:getItem():getSignature() == player:getName()) or
                guildId == invaderXim.guild.FISHING
            then
                player:setCharVar(npcTable[npcName][6], 0)
                giveNewRank(player, skillId, newRank)
                player:startEvent(eventId, 0, 0, 0, 0, newRank, 1)
            else
                player:startEvent(eventId, 0, 0, 0, 0, newRank, 0)
            end

        -- All other ranks.
        elseif
            newRank > invaderXim.craftRank.AMATEUR and
            newRank < lastRank
        then
            giveNewRank(player, skillId, newRank)
            player:startEvent(eventId, 0, 0, 0, 0, newRank, 0)
        end
    end
end

invaderXim.crafting.guildMasterOnTrigger = function(player, npc)
    local npcName  = npc:getName()
    local eventId  = npcTable[npcName][1]
    local guildId  = npcTable[npcName][2]
    local skillId  = npcTable[npcName][3]
    local keyItem  = npcTable[npcName][5]
    local nextRank = player:getSkillRank(skillId) + 1

    -- Event parameters
    local testItem       = os.time()                                     -- Parameter 1: Current time OR Test Item if applicable.
    local skillLevel     = invaderXim.crafting.getRealSkill(player, skillId)     -- Parameter 2: Player real level on concrete craft.
    local skillCap       = invaderXim.crafting.getCraftSkillCap(player, skillId) -- Parameter 3: Player max level on concrete craft.
    local guildsJoined   = player:getCharVar('Guild_Member')             -- Parameter 4: Bitmask with guilds joined.
    local questStatus    = 0                                             -- Parameter 5: Used for expert quest.
    local artisanCount   = 0                                             -- Parameter 7: Number of crafts at Artisan rank or higher.
    local artisanBitmask = 0                                             -- Parameter 8: Bitmask of craft guilds at Artisan rank or higher.

    -- Calculate parameter 1 (Test item)
    if
        skillLevel >= skillCap - 2 and
        nextRank <= lastRank
    then
        testItem = testItemTable[guildId][nextRank]
    end

    -- Calculate parameter 5 (Quest status)
    local questVar = player:getCharVar(npcTable[npcName][6])

    if questVar > 0 then
        questStatus = bit.lshift(1, 9) -- Set bit 9 (Quest accepted)

        if player:hasKeyItem(keyItem) then
            questStatus = questStatus + bit.lshift(1, guildId) -- Set KI bit (Item revealed) (It happens to be the same bit as guild bit)
        end

        if questVar == 2 then
            questStatus = questStatus + bit.lshift(1, 10) -- Set bit 10 (Item reminder)
        end
    end

    -- Calculate parameters 7 and 8 (Used for rank renouncement)
    -- Note 1: It cycles. First time returns params. Second doesnt. Third does. And so on.
    -- Note 2: Highest level craft cannot be renounced.
    if
        invaderXim.crafting.hasJoinedGuild(player, guildId) and
        guildId ~= invaderXim.guild.FISHING
    then
        if player:getLocalVar('skipRenounceDialog') == 0 then
            local rankChecked       = 0
            local highestSkillId    = 0
            local highestSkillLevel = 0
            local currentSkillLevel = 0

            -- Track highest skill. This one wont appear in renounce list.
            for skillChecked = invaderXim.skill.WOODWORKING, invaderXim.skill.COOKING do
                currentSkillLevel = player:getCharSkillLevel(skillChecked)

                if currentSkillLevel > highestSkillLevel then
                    highestSkillLevel = currentSkillLevel
                    highestSkillId    = skillChecked
                end
            end

            local rankFromSetting = math.floor(invaderXim.settings.map.CRAFT_COMMON_CAP / 100) -- If 700, it will return rank 7 (Artisan)

            -- Params 7 and 8.
            for skillChecked = invaderXim.skill.WOODWORKING, invaderXim.skill.COOKING do
                rankChecked = player:getSkillRank(skillChecked)

                -- Param 7: Count crafts over craftsman rank.
                if rankChecked >= rankFromSetting then
                    artisanCount = artisanCount + 1
                end

                -- Param 8: Full mask except craft ids that CAN be renounced.
                if
                    rankChecked < rankFromSetting or
                    skillChecked == highestSkillId
                then
                    artisanBitmask = bit.bor(artisanBitmask, bit.lshift(1, skillChecked - 48))
                end
            end

            player:setLocalVar('skipRenounceDialog', 1)
        else
            player:setLocalVar('skipRenounceDialog', 0)
        end
    end

    player:startEvent(eventId, testItem, skillLevel, skillCap, guildsJoined, questStatus, 0, artisanCount, artisanBitmask)
end

invaderXim.crafting.guildMasterOnEventFinish = function(player, csid, option, npc)
    local ID      = zones[player:getZoneID()]
    local npcName = npc:getName()
    local eventId = npcTable[npcName][1]
    local guildId = npcTable[npcName][2]

    -- Trigger onEventFinish
    if csid == eventId then

        -- Signup Event.
        if option == 1 then
            local crystalId = npcTable[npcName][4] -- Crystal

            if player:getFreeSlotsCount() == 0 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, crystalId)
            else
                player:messageSpecial(ID.text.ITEM_OBTAINED, crystalId)
                player:addItem(crystalId)
                player:incrementCharVar('Guild_Member', bit.lshift(1, guildId))
            end

        -- Expert quest: Start.
        elseif option == 2 then
            if invaderXim.crafting.hasJoinedGuild(player, guildId) then
                if player:getCharVar(npcTable[npcName][6]) == 0 then
                    player:setCharVar(npcTable[npcName][6], 1)
                end
            end

        -- Expert quest ready for trade (after getting KI)
        elseif option == 3 then
            player:setCharVar(npcTable[npcName][6], 2)

        -- Rank renouncement.
        elseif
            option >= invaderXim.skill.WOODWORKING and
            option <= invaderXim.skill.COOKING
        then
            local rankFromSetting = math.floor(invaderXim.settings.map.CRAFT_COMMON_CAP / 100) - 1  -- If 700, it will return rank 6 (Craftsman)

            player:setSkillRank(option, rankFromSetting)
            player:setSkillLevel(option, invaderXim.settings.map.CRAFT_COMMON_CAP)

            player:messageSpecial(ID.text.RENOUNCE_CRAFTSMAN, 0, option - 49)
        end

    -- Trade onEventFinish
    elseif csid == eventId + 1 then
        if player:getLocalVar('CompleteTrade') == 1 then
            player:tradeComplete()
            player:setLocalVar('CompleteTrade', 0)
        end
    end

    -- Handle RoE.
    if guildId ~= invaderXim.guild.FISHING then
        local recordId = guildId + 99

        if player:hasEminenceRecord(recordId) then
            invaderXim.roe.onRecordTrigger(player, recordId)
        end
    end
end
