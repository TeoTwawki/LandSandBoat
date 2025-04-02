-----------------------------------
-- Nyzul Isle: Treasure caskets and coffers methods and data.
-----------------------------------
local ID = zones[invaderXim.zone.NYZUL_ISLE]
require('scripts/globals/appraisal')
-----------------------------------
xi = xi or {}
invaderXim.nyzul = invaderXim.nyzul or {}

local tempBoxItems =
{
    [ 1] = { itemID = invaderXim.item.BOTTLE_OF_BARBARIANS_DRINK, amount = math.random(1, 3) },
    [ 2] = { itemID = invaderXim.item.BOTTLE_OF_FIGHTERS_DRINK,   amount = math.random(1, 3) },
    [ 3] = { itemID = invaderXim.item.BOTTLE_OF_ORACLES_DRINK,    amount = math.random(1, 3) },
    [ 4] = { itemID = invaderXim.item.BOTTLE_OF_ASSASSINS_DRINK,  amount = math.random(1, 3) },
    [ 5] = { itemID = invaderXim.item.BOTTLE_OF_SPYS_DRINK,       amount = math.random(1, 3) },
    [ 6] = { itemID = invaderXim.item.BOTTLE_OF_BRAVERS_DRINK,    amount = math.random(1, 3) },
    [ 7] = { itemID = invaderXim.item.BOTTLE_OF_SOLDIERS_DRINK,   amount = math.random(1, 3) },
    [ 8] = { itemID = invaderXim.item.BOTTLE_OF_CHAMPIONS_DRINK,  amount = math.random(1, 3) },
    [ 9] = { itemID = invaderXim.item.BOTTLE_OF_MONARCHS_DRINK,   amount = math.random(1, 3) },
    [10] = { itemID = invaderXim.item.BOTTLE_OF_GNOSTICS_DRINK,   amount = math.random(1, 3) },
    [11] = { itemID = invaderXim.item.BOTTLE_OF_CLERICS_DRINK,    amount = math.random(1, 3) },
    [12] = { itemID = invaderXim.item.BOTTLE_OF_SHEPHERDS_DRINK,  amount = math.random(1, 3) },
    [13] = { itemID = invaderXim.item.BOTTLE_OF_SPRINTERS_DRINK,  amount = math.random(1, 3) },
    [14] = { itemID = invaderXim.item.FLASK_OF_STRANGE_MILK,      amount = math.random(1, 5) },
    [15] = { itemID = invaderXim.item.BOTTLE_OF_STRANGE_JUICE,    amount = math.random(1, 5) },
    [16] = { itemID = invaderXim.item.BOTTLE_OF_FANATICS_DRINK,   amount = 1                 },
    [17] = { itemID = invaderXim.item.BOTTLE_OF_FOOLS_DRINK,      amount = 1                 },
    [18] = { itemID = invaderXim.item.DUSTY_WING,                 amount = 1                 },
    [19] = { itemID = invaderXim.item.BOTTLE_OF_VICARS_DRINK,     amount = math.random(1, 3) },
    [20] = { itemID = invaderXim.item.DUSTY_POTION,               amount = math.random(1, 3) },
    [21] = { itemID = invaderXim.item.DUSTY_ETHER,                amount = math.random(1, 3) },
    [22] = { itemID = invaderXim.item.DUSTY_ELIXIR,               amount = 1                 }
}

local appraisalItems =
{
    [invaderXim.appraisal.origin.NYZUL_BAT_EYE              ] = invaderXim.item.UNAPPRAISED_AXE,
    [invaderXim.appraisal.origin.NYZUL_SHADOW_EYE           ] = invaderXim.item.UNAPPRAISED_NECKLACE,
    [invaderXim.appraisal.origin.NYZUL_BOMB_KING            ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_JUGGLER_HECATOMB     ] = invaderXim.item.UNAPPRAISED_POLEARM,
    [invaderXim.appraisal.origin.NYZUL_SMOTHERING_SCHMIDT   ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_HELLION              ] = invaderXim.item.UNAPPRAISED_POLEARM,
    [invaderXim.appraisal.origin.NYZUL_LEAPING_LIZZY        ] = invaderXim.item.UNAPPRAISED_FOOTWEAR,
    [invaderXim.appraisal.origin.NYZUL_TOM_TIT_TAT          ] = invaderXim.item.UNAPPRAISED_DAGGER,
    [invaderXim.appraisal.origin.NYZUL_JAGGEDY_EARED_JACK   ] = invaderXim.item.UNAPPRAISED_NECKLACE,
    [invaderXim.appraisal.origin.NYZUL_CACTUAR_CANTAUTOR    ] = invaderXim.item.UNAPPRAISED_FOOTWEAR,
    [invaderXim.appraisal.origin.NYZUL_GARGANTUA            ] = invaderXim.item.UNAPPRAISED_NECKLACE,
    [invaderXim.appraisal.origin.NYZUL_GYRE_CARLIN          ] = invaderXim.item.UNAPPRAISED_BOW,
    [invaderXim.appraisal.origin.NYZUL_ASPHYXIATED_AMSEL    ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_FROSTMANE            ] = invaderXim.item.UNAPPRAISED_SWORD,
    [invaderXim.appraisal.origin.NYZUL_PEALLAIDH            ] = invaderXim.item.UNAPPRAISED_GLOVES,
    [invaderXim.appraisal.origin.NYZUL_CARNERO              ] = invaderXim.item.UNAPPRAISED_SWORD,
    [invaderXim.appraisal.origin.NYZUL_FALCATUS_ARANEI      ] = invaderXim.item.UNAPPRAISED_POLEARM,
    [invaderXim.appraisal.origin.NYZUL_EMERGENT_ELM         ] = invaderXim.item.UNAPPRAISED_SWORD,
    [invaderXim.appraisal.origin.NYZUL_OLD_TWO_WINGS        ] = invaderXim.item.UNAPPRAISED_CAPE,
    [invaderXim.appraisal.origin.NYZUL_AIATAR               ] = invaderXim.item.UNAPPRAISED_BOX,
    [invaderXim.appraisal.origin.NYZUL_INTULO               ] = invaderXim.item.UNAPPRAISED_BOX,
    [invaderXim.appraisal.origin.NYZUL_ORCTRAP              ] = invaderXim.item.UNAPPRAISED_DAGGER,
    [invaderXim.appraisal.origin.NYZUL_VALKURM_EMPEROR      ] = invaderXim.item.UNAPPRAISED_HEADPIECE,
    [invaderXim.appraisal.origin.NYZUL_CRUSHED_KRAUSE       ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_STINGING_SOPHIE      ] = invaderXim.item.UNAPPRAISED_DAGGER,
    [invaderXim.appraisal.origin.NYZUL_SERPOPARD_ISHTAR     ] = invaderXim.item.UNAPPRAISED_NECKLACE,
    [invaderXim.appraisal.origin.NYZUL_WESTERN_SHADOW       ] = invaderXim.item.UNAPPRAISED_DAGGER,
    [invaderXim.appraisal.origin.NYZUL_BLOODTEAR_BALDURF    ] = invaderXim.item.UNAPPRAISED_SHIELD,
    [invaderXim.appraisal.origin.NYZUL_ZIZZY_ZILLAH         ] = invaderXim.item.UNAPPRAISED_SWORD,
    [invaderXim.appraisal.origin.NYZUL_ELLYLLON             ] = invaderXim.item.UNAPPRAISED_HEADPIECE,
    [invaderXim.appraisal.origin.NYZUL_MISCHIEVOUS_MICHOLAS ] = invaderXim.item.UNAPPRAISED_DAGGER,
    [invaderXim.appraisal.origin.NYZUL_LEECH_KING           ] = invaderXim.item.UNAPPRAISED_EARRING,
    [invaderXim.appraisal.origin.NYZUL_EASTERN_SHADOW       ] = invaderXim.item.UNAPPRAISED_BOW,
    [invaderXim.appraisal.origin.NYZUL_NUNYENUNC            ] = invaderXim.item.UNAPPRAISED_POLEARM,
    [invaderXim.appraisal.origin.NYZUL_HELLDIVER            ] = invaderXim.item.UNAPPRAISED_BOW,
    [invaderXim.appraisal.origin.NYZUL_TAISAIJIN            ] = invaderXim.item.UNAPPRAISED_HEADPIECE,
    [invaderXim.appraisal.origin.NYZUL_FUNGUS_BEETLE        ] = invaderXim.item.UNAPPRAISED_SHIELD,
    [invaderXim.appraisal.origin.NYZUL_FRIAR_RUSH           ] = invaderXim.item.UNAPPRAISED_BOX,
    [invaderXim.appraisal.origin.NYZUL_PULVERIZED_PFEFFER   ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_ARGUS                ] = invaderXim.item.UNAPPRAISED_NECKLACE,
    [invaderXim.appraisal.origin.NYZUL_BLOODPOOL_VORAX      ] = invaderXim.item.UNAPPRAISED_NECKLACE,
    [invaderXim.appraisal.origin.NYZUL_NIGHTMARE_VASE       ] = invaderXim.item.UNAPPRAISED_DAGGER,
    [invaderXim.appraisal.origin.NYZUL_DAGGERCLAW_DRACOS    ] = invaderXim.item.UNAPPRAISED_DAGGER,
    [invaderXim.appraisal.origin.NYZUL_NORTHERN_SHADOW      ] = invaderXim.item.UNAPPRAISED_AXE,
    [invaderXim.appraisal.origin.NYZUL_FRAELISSA            ] = { invaderXim.item.UNAPPRAISED_CAPE, invaderXim.item.UNAPPRAISED_BOW },
    [invaderXim.appraisal.origin.NYZUL_ROC                  ] = invaderXim.item.UNAPPRAISED_POLEARM,
    [invaderXim.appraisal.origin.NYZUL_SABOTENDER_BAILARIN  ] = invaderXim.item.UNAPPRAISED_BOX,
    [invaderXim.appraisal.origin.NYZUL_AQUARIUS             ] = invaderXim.item.UNAPPRAISED_AXE,
    [invaderXim.appraisal.origin.NYZUL_ENERGETIC_ERUCA      ] = invaderXim.item.UNAPPRAISED_GLOVES,
    [invaderXim.appraisal.origin.NYZUL_SPINY_SPIPI          ] = invaderXim.item.UNAPPRAISED_CAPE,
    [invaderXim.appraisal.origin.NYZUL_TRICKSTER_KINETIX    ] = invaderXim.item.UNAPPRAISED_AXE,
    [invaderXim.appraisal.origin.NYZUL_DROOLING_DAISY       ] = invaderXim.item.UNAPPRAISED_HEADPIECE,
    [invaderXim.appraisal.origin.NYZUL_BONNACON             ] = invaderXim.item.UNAPPRAISED_FOOTWEAR,
    [invaderXim.appraisal.origin.NYZUL_GOLDEN_BAT           ] = invaderXim.item.UNAPPRAISED_CAPE,
    [invaderXim.appraisal.origin.NYZUL_STEELFLEECE_BALDARICH] = invaderXim.item.UNAPPRAISED_SHIELD,
    [invaderXim.appraisal.origin.NYZUL_SABOTENDER_MARIACHI  ] = invaderXim.item.UNAPPRAISED_DAGGER,
    [invaderXim.appraisal.origin.NYZUL_UNGUR                ] = invaderXim.item.UNAPPRAISED_BOW,
    [invaderXim.appraisal.origin.NYZUL_SWAMFISK             ] = invaderXim.item.UNAPPRAISED_POLEARM,
    [invaderXim.appraisal.origin.NYZUL_BUBURIMBOO           ] = invaderXim.item.UNAPPRAISED_NECKLACE,
    [invaderXim.appraisal.origin.NYZUL_KEEPER_OF_HALIDOM    ] = invaderXim.item.UNAPPRAISED_SWORD,
    [invaderXim.appraisal.origin.NYZUL_SERKET               ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_DUNE_WIDOW           ] = invaderXim.item.UNAPPRAISED_NECKLACE,
    [invaderXim.appraisal.origin.NYZUL_ODQAN                ] = invaderXim.item.UNAPPRAISED_BOX,
    [invaderXim.appraisal.origin.NYZUL_BURNED_BERGMANN      ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_TYRANNIC_TUNNOK      ] = invaderXim.item.UNAPPRAISED_AXE,
    [invaderXim.appraisal.origin.NYZUL_BLOODSUCKER          ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_TOTTERING_TOBY       ] = invaderXim.item.UNAPPRAISED_FOOTWEAR,
    [invaderXim.appraisal.origin.NYZUL_SOUTHERN_SHADOW      ] = invaderXim.item.UNAPPRAISED_SHIELD,
    [invaderXim.appraisal.origin.NYZUL_SHARP_EARED_ROPIPI   ] = invaderXim.item.UNAPPRAISED_HEADPIECE,
    [invaderXim.appraisal.origin.NYZUL_PANZER_PERCIVAL      ] = invaderXim.item.UNAPPRAISED_AXE,
    [invaderXim.appraisal.origin.NYZUL_VOUIVRE              ] = invaderXim.item.UNAPPRAISED_POLEARM,
    [invaderXim.appraisal.origin.NYZUL_JOLLY_GREEN          ] = invaderXim.item.UNAPPRAISED_SASH,
    [invaderXim.appraisal.origin.NYZUL_TUMBLING_TRUFFLE     ] = invaderXim.item.UNAPPRAISED_HEADPIECE,
    [invaderXim.appraisal.origin.NYZUL_CAPRICIOUS_CASSIE    ] = invaderXim.item.UNAPPRAISED_EARRING,
    [invaderXim.appraisal.origin.NYZUL_AMIKIRI              ] = invaderXim.item.UNAPPRAISED_SWORD,
    [invaderXim.appraisal.origin.NYZUL_STRAY_MARY           ] = invaderXim.item.UNAPPRAISED_BOX,
    [invaderXim.appraisal.origin.NYZUL_SEWER_SYRUP          ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_UNUT                 ] = invaderXim.item.UNAPPRAISED_BOX,
    [invaderXim.appraisal.origin.NYZUL_SIMURGH              ] = invaderXim.item.UNAPPRAISED_FOOTWEAR,
    [invaderXim.appraisal.origin.NYZUL_PELICAN              ] = invaderXim.item.UNAPPRAISED_SHIELD,
    [invaderXim.appraisal.origin.NYZUL_CARGO_CRAB_COLIN     ] = invaderXim.item.UNAPPRAISED_SWORD,
    [invaderXim.appraisal.origin.NYZUL_WOUNDED_WURFEL       ] = invaderXim.item.UNAPPRAISED_RING,
    [invaderXim.appraisal.origin.NYZUL_PEG_POWLER           ] = invaderXim.item.UNAPPRAISED_AXE,
    [invaderXim.appraisal.origin.NYZUL_JADED_JODY           ] = invaderXim.item.UNAPPRAISED_BOX,
    [invaderXim.appraisal.origin.NYZUL_MAIGHDEAN_UAINE      ] = invaderXim.item.UNAPPRAISED_EARRING,
}

invaderXim.nyzul.tempBoxTrigger = function(player, npc)
    -- First interaction. Select items and open crate.
    if npc:getLocalVar('itemsPicked') == 0 then
        -- Build table.
        local dTableBoxItems = {}
        for i = 1, #tempBoxItems do
            table.insert(dTableBoxItems, i, tempBoxItems[i])
        end

        -- Execute rolls.
        local item2Random = math.random(1, 100)
        local item3Random = math.random(1, 100)

        -- Select items and amounts. Save selection into local vars.
        local entry = math.random(1, #dTableBoxItems)
        local item  = dTableBoxItems[entry]

        npc:setLocalVar('itemID_1', item.itemID)
        npc:setLocalVar('itemAmount_1', item.amount)
        table.remove(dTableBoxItems, entry)

        if item2Random <= 60 then
            entry = math.random(1, #dTableBoxItems)
            item  = dTableBoxItems[entry]

            npc:setLocalVar('itemID_2', item.itemID)
            npc:setLocalVar('itemAmount_2', item.amount)
            table.remove(tempBoxItems, entry)
        end

        if item2Random <= 60 and item3Random <= 20 then
            entry = math.random(1, #dTableBoxItems)
            item  = dTableBoxItems[entry]

            npc:setLocalVar('itemID_3', item.itemID)
            npc:setLocalVar('itemAmount_3', item.amount)
            table.remove(tempBoxItems, entry)
        end

        npc:entityAnimationPacket(invaderXim.animationString.OPEN_CRATE_GLOW)
        npc:setAnimationSub(13)

        npc:setLocalVar('itemsPicked', 1)
    end

    player:startEvent(2, {
        [0] = (npc:getLocalVar('itemID_1') + (npc:getLocalVar('itemAmount_1') * 65536)),
        [1] = (npc:getLocalVar('itemID_2') + (npc:getLocalVar('itemAmount_2') * 65536)),
        [2] = (npc:getLocalVar('itemID_3') + (npc:getLocalVar('itemAmount_3') * 65536))
    })
end

invaderXim.nyzul.handleAppraisalItem = function(player, npc)
    local instance = npc:getInstance()
    local chars    = instance:getChars()

    for cofferID = ID.npc.TREASURE_COFFER_OFFSET, ID.npc.TREASURE_COFFER_OFFSET + 2 do
        if npc:getID() == cofferID and npc:getLocalVar('opened') == 0 then
            -- Appraisal Items
            local mobOffset = npc:getLocalVar('appraisalItem') - (ID.mob.NM_OFFSET - invaderXim.appraisal.origin.NYZUL_BAT_EYE) -- Bat Eye mobId - Appraisal mob value.

            if mobOffset == 166 or mobOffset == 187 then
                mobOffset = 108
            elseif mobOffset == 154 or mobOffset == 172 or mobOffset == 190 then
                mobOffset = 136
            end

            local itemID = appraisalItems[mobOffset]

            if type(itemID) == 'table' then
                local pick = math.random(1, #itemID)
                itemID     = itemID[pick]
            end

            if player:getFreeSlotsCount() == 0 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemID)

                return
            end

            player:addItem({ id = itemID, appraisal = mobOffset })

            for _, players in pairs(chars) do
                players:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, itemID)
            end

            npc:entityAnimationPacket(invaderXim.animationString.OPEN_CRATE_GLOW)
            npc:setLocalVar('opened', 1)
            npc:setUntargetable(true)
            npc:queue(10000, function(npcvar)
                npcvar:entityAnimationPacket(invaderXim.animationString.STATUS_DISAPPEAR)
            end)

            npc:queue(12000, function(npcvar)
                npcvar:setStatus(invaderXim.status.DISAPPEAR)
                npcvar:resetLocalVars()
                npcvar:setAnimationSub(0)
            end)

            break
        end
    end
end

invaderXim.nyzul.tempBoxFinish = function(player, csid, option, npc)
    if csid == 2 then
        local item1 = npc:getLocalVar('itemID_1')
        local item2 = npc:getLocalVar('itemID_2')
        local item3 = npc:getLocalVar('itemID_3')

        if
            option == 1 and
            item1 > 0 and
            npc:getLocalVar('itemAmount_1') > 0
        then
            if not player:hasItem(item1, invaderXim.inventoryLocation.TEMPITEMS) then
                player:addTempItem(item1)
                player:messageName(ID.text.PLAYER_OBTAINS_TEMP_ITEM, player, item1)
                npc:setLocalVar('itemAmount_1', npc:getLocalVar('itemAmount_1') - 1)
            else
                player:messageSpecial(ID.text.ALREADY_HAVE_TEMP_ITEM)
            end

        elseif
            option == 2 and
            item2 > 0 and
            npc:getLocalVar('itemAmount_2') > 0
        then
            if not player:hasItem(item2, invaderXim.inventoryLocation.TEMPITEMS) then
                player:addTempItem(item2)
                player:messageName(ID.text.PLAYER_OBTAINS_TEMP_ITEM, player, item2)
                npc:setLocalVar('itemAmount_2', npc:getLocalVar('itemAmount_2') - 1)
            else
                player:messageSpecial(ID.text.ALREADY_HAVE_TEMP_ITEM)
            end

        elseif
            option == 3 and
            item3 > 0 and
            npc:getLocalVar('itemAmount_3') > 0
        then
            if not player:hasItem(item3, invaderXim.inventoryLocation.TEMPITEMS) then
                player:addTempItem(item3)
                player:messageName(ID.text.PLAYER_OBTAINS_TEMP_ITEM, player, item3)
                npc:setLocalVar('itemAmount_3', npc:getLocalVar('itemAmount_3') - 1)
            else
                player:messageSpecial(ID.text.ALREADY_HAVE_TEMP_ITEM)
            end
        end

        if
            npc:getLocalVar('itemAmount_1') == 0 and
            npc:getLocalVar('itemAmount_2') == 0 and
            npc:getLocalVar('itemAmount_3') == 0
        then
            npc:queue(10000, function(npcvar)
                npcvar:entityAnimationPacket(invaderXim.animationString.STATUS_DISAPPEAR)
            end)

            npc:queue(12000, function(npcvar)
                npcvar:setStatus(invaderXim.status.DISAPPEAR)
                npcvar:setAnimationSub(0)
                npcvar:resetLocalVars()
            end)
        end
    end
end
