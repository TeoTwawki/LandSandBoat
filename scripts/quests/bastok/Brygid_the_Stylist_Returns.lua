-----------------------------------
-- Brygid the Stylist Returns
-----------------------------------
-- Log ID: 1, Quest ID: 74
-- Brygid : !pos -90 -4 -108 235
-----------------------------------

local quest = Quest:new(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.BRYGID_THE_STYLIST_RETURNS)

quest.reward =
{
    fame     = 30,
    fameArea = invaderXim.fameArea.BASTOK,
    title    = invaderXim.title.BASTOKS_SECOND_BEST_DRESSED,
}

local requestedBodyItems =
{
    invaderXim.item.BREASTPLATE,
    invaderXim.item.SILVER_MAIL,
    invaderXim.item.BANDED_MAIL,
    invaderXim.item.CUIR_BOUILLI,
    invaderXim.item.RAPTOR_JERKIN,
    invaderXim.item.PADDED_ARMOR,
    invaderXim.item.GAMBISON,
    invaderXim.item.WOOL_GAMBISON,
    invaderXim.item.VELVET_ROBE,
    invaderXim.item.SILK_COAT,
    invaderXim.item.CLOAK,
    invaderXim.item.WHITE_CLOAK,
    invaderXim.item.BEAK_JERKIN,
    invaderXim.item.CARAPACE_HARNESS,
    invaderXim.item.PYRO_ROBE,
    invaderXim.item.FROST_ROBE,
    invaderXim.item.LINEN_DOUBLET,
    invaderXim.item.WOOL_DOUBLET,
    invaderXim.item.IRON_SCALE_MAIL,
    invaderXim.item.BISHOPS_ROBE,
}

local requestedLegItems =
{
    invaderXim.item.CUISSES,
    invaderXim.item.SILVER_HOSE,
    invaderXim.item.BREECHES,
    invaderXim.item.CUIR_TROUSERS,
    invaderXim.item.RAPTOR_TROUSERS,
    invaderXim.item.BEAK_TROUSERS,
    invaderXim.item.IRON_SUBLIGAR,
    invaderXim.item.CARAPACE_SUBLIGAR,
    invaderXim.item.SCORPION_SUBLIGAR,
    invaderXim.item.HOSE,
    invaderXim.item.WOOL_HOSE,
    invaderXim.item.VELVET_SLOPS,
    invaderXim.item.SILK_SLOPS,
    invaderXim.item.LINEN_SLACKS,
    invaderXim.item.WHITE_SLACKS,
    invaderXim.item.IRON_CUISSES,
}

-- [option] = { rewardItem, requiredItem }
local optionToItems =
{
    [ 1] = { invaderXim.item.DUENDE_COTEHARDIE,   invaderXim.item.ARIES_SUBLIGAR       },
    [ 2] = { invaderXim.item.NOKIZARU_GI,         invaderXim.item.TAURUS_SUBLIGAR      },
    [ 3] = { invaderXim.item.RAPPAREE_HARNESS,    invaderXim.item.GEMINI_SUBLIGAR      },
    [ 4] = { invaderXim.item.SHINIMUSHA_HARA_ATE, invaderXim.item.CANCER_SUBLIGAR      },
    [ 5] = { invaderXim.item.WYVERN_MAIL,         invaderXim.item.LEO_SUBLIGAR         },
    [ 6] = { invaderXim.item.SHIKAREE_AKETON,     invaderXim.item.VIRGO_SUBLIGAR       },
    [ 7] = { invaderXim.item.CERISE_DOUBLET,      invaderXim.item.LIBRA_SUBLIGAR       },
    [ 8] = { invaderXim.item.GLAMOR_JUPON,        invaderXim.item.SCORPIUS_SUBLIGAR    },
    [ 9] = { invaderXim.item.GLOOM_BREASTPLATE,   invaderXim.item.SAGITTARIUS_SUBLIGAR },
    [10] = { invaderXim.item.NIMBUS_DOUBLET,      invaderXim.item.CAPRICORNUS_SUBLIGAR },
    [11] = { invaderXim.item.AIKIDO_GI,           invaderXim.item.AQUARIUS_SUBLIGAR    },
    [12] = { invaderXim.item.PARADE_CUIRASS,      invaderXim.item.PISCES_SUBLIGAR      },
    [13] = { invaderXim.item.GAUDY_HARNESS,       invaderXim.item.OPHIUCHUS_SUBLIGAR   },
}

local getRandomEquippableItem = function(player, itemList)
    -- To not repeatedly select a random number and compare, first generate a list
    -- of known items that can be equipped.
    local equippableItems = {}

    for _, itemId in ipairs(itemList) do
        if player:canEquipItem(itemId, false) then
            table.insert(equippableItems, itemId)
        end
    end

    return equippableItems[math.random(1, #equippableItems)]
end

local hasArtifactArmorEquipped = function(player)
    for equipSlot = invaderXim.slot.HEAD, invaderXim.slot.FEET do
        if invaderXim.equip.isArtifactArmor(player:getEquipID(equipSlot)) then
            return true
        end
    end

    return false
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_ACCEPTED and
                player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.BRYGID_THE_STYLIST) and
                hasArtifactArmorEquipped(player)
        end,

        [invaderXim.zone.BASTOK_MARKETS] =
        {
            ['Brygid'] =
            {
                onTrigger = function(player, npc)
                    local hasRobeEquipped = player:getEquipID(invaderXim.slot.BODY) == invaderXim.item.ROBE and 1 or 0
                    local requestedBody   = getRandomEquippableItem(player, requestedBodyItems)
                    local requestedLegs   = getRandomEquippableItem(player, requestedLegItems)

                    quest:setVar(player, 'requestedBody', requestedBody)
                    quest:setVar(player, 'requestedLegs', requestedLegs)

                    return quest:progressEvent(380, hasRobeEquipped, requestedBody, requestedLegs, player:getMainJob())
                end,
            },

            onEventFinish =
            {
                [380] = function(player, csid, option, npc)
                    player:delQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.BRYGID_THE_STYLIST_RETURNS)
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
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, optionToItems[quest:getVar(player, 'Option')][2]) then
                        return quest:progressEvent(383)
                    end
                end,

                onTrigger = function(player, npc)
                    local questOption = quest:getVar(player, 'Option')

                    if questOption == 0 then
                        if
                            player:getEquipID(invaderXim.slot.BODY) == quest:getVar(player, 'requestedBody') and
                            player:getEquipID(invaderXim.slot.LEGS) == quest:getVar(player, 'requestedLegs')
                        then
                            return quest:progressEvent(382)
                        else
                            local hasRobeEquipped = player:getEquipID(invaderXim.slot.BODY) == invaderXim.item.ROBE and 1 or 0
                            local requestedBody   = quest:getVar(player, 'requestedBody')
                            local requestedLegs   = quest:getVar(player, 'requestedLegs')

                            return quest:event(381, hasRobeEquipped, requestedBody, requestedLegs, player:getMainJob())
                        end
                    else
                        local optionList = optionToItems[questOption]

                        return quest:event(385, 0, optionList[1], optionList[2])
                    end
                end,
            },

            onEventUpdate =
            {
                [382] = function(player, csid, option, npc)
                    local rewardItem     = invaderXim.item.DUENDE_COTEHARDIE - 1 + option
                    local canEquipReward = player:canEquipItem(rewardItem, true) and 1 or 0
                    local hasReward      = not player:hasItem(rewardItem) and 1 or 0

                    player:updateEvent(0, option - 1, hasReward, canEquipReward)
                end,
            },

            onEventFinish =
            {
                [382] = function(player, csid, option, npc)
                    if option ~= 99 then
                        quest:setVar(player, 'Option', option)
                    end
                end,

                [383] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, optionToItems[quest:getVar(player, 'Option')][1]) then
                        player:confirmTrade()
                        quest:complete(player)
                    end
                end,
            },
        },
    },
}

return quest
