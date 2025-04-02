-----------------------------------
-- func: getstats
-- desc: prints stats of cursor target into chatlog, for debugging.
-----------------------------------
---@type TCommand
local commandObj = {}

local options =
{
    [1] = 'base',
    [2] = 'defensive',
    [3] = 'offensive',
    [4] = 'elements',
}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

commandObj.onTrigger = function(player, option)
    local target = player:getCursorTarget()
    if target == nil then
        player:printToPlayer('Target something first.')
        return
    end

    local targetType = target:getObjType()

    if targetType == invaderXim.objType.NPC then
        player:printToPlayer('Target something other than an NPC..They don\'t have stats!')
        return
    end

    -- map integer option to a name for easier reading in if/else for convenient use
    if
        options[tonumber(option)]
    then
        option = options[tonumber(option)]
    end

    player:printToPlayer('Stats for ' .. target:getName(), invaderXim.msg.channel.SYSTEM_3)
    switch(option): caseof
    {
        ['base'] = function()
            player:printToPlayer(string.format('MainJob(jID: %s) LV: %i / SubJob(jID: %s) LV: %i ',
                target:getMainJob(), target:getMainLvl(), target:getSubJob(), target:getSubLvl()), invaderXim.msg.channel.SYSTEM_3)

            player:printToPlayer(string.format('HP: %i/%i  MP: %i/%i (current/max) ',
                target:getHP(), target:getMaxHP(), target:getMP(), target:getMaxMP()), invaderXim.msg.channel.SYSTEM_3)

            player:printToPlayer(string.format('Total STR: %i ', target:getStat(invaderXim.mod.STR)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total DEX: %i ', target:getStat(invaderXim.mod.DEX)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total VIT: %i ', target:getStat(invaderXim.mod.VIT)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total AGI: %i ', target:getStat(invaderXim.mod.AGI)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total MND: %i ', target:getStat(invaderXim.mod.MND)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total INT: %i ', target:getStat(invaderXim.mod.INT)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total CHR: %i ', target:getStat(invaderXim.mod.CHR)), invaderXim.msg.channel.SYSTEM_3)
            if targetType == invaderXim.objType.PC then
                player:printToPlayer(string.format('Total Subtle Blow: %i ', target:getMod(invaderXim.mod.SUBTLE_BLOW)), invaderXim.msg.channel.SYSTEM_3)
                player:printToPlayer(string.format('Total Store TP: %i ', target:getMod(invaderXim.mod.STORETP)), invaderXim.msg.channel.SYSTEM_3)
                player:printToPlayer(string.format('%s\'s base Treasure Hunter with current equipment: %i', target:getName(), target:getMod(invaderXim.mod.TREASURE_HUNTER)), invaderXim.msg.channel.SYSTEM_3)
            elseif targetType == invaderXim.objType.MOB then
                player:printToPlayer(string.format('Mob\'s current Treasure Hunter Tier: %i', target:getTHlevel()), invaderXim.msg.channel.SYSTEM_3)
                player:printToPlayer(string.format('Battletime: %i ', target:getBattleTime()), invaderXim.msg.channel.SYSTEM_3)
            end
        end,

        ['offensive'] = function()
            player:printToPlayer(string.format('Food Accuracy%% bonus: %i ', target:getMod(invaderXim.mod.FOOD_ACCP)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Accuracy Base: %i ', target:getMod(invaderXim.mod.ACC)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total Accuracy: %i ', target:getStat(invaderXim.mod.ACC)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Attack Base: %i ', target:getMod(invaderXim.mod.ATT)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total Attack: %i ', target:getStat(invaderXim.mod.ATT)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Main Weap Dmg: %i ', target:getWeaponDmg()), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('RAccuracy Base: %i ', target:getMod(invaderXim.mod.RACC)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total RAccuracy: %i ', target:getStat(invaderXim.mod.RACC)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Ranged Weap Dmg: %i ', target:getRangedDmg()), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Magic Attack bonus: %i ', target:getMod(invaderXim.mod.MATT)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Magic Accuracy bonus: %i ', target:getMod(invaderXim.mod.MACC)), invaderXim.msg.channel.SYSTEM_3)

            return
        end,

        ['defensive'] = function()
            player:printToPlayer(string.format('EVA Base: %i ', target:getMod(invaderXim.mod.EVA)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('EVA Total: %i ', target:getStat(invaderXim.mod.EVA)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Magic EVA Base: %i ', target:getMod(invaderXim.mod.MEVA)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Defense Base: %i ', target:getMod(invaderXim.mod.DEF)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Total Defense: %i ', target:getStat(invaderXim.mod.DEF)), invaderXim.msg.channel.SYSTEM_3)
            player:printToPlayer(string.format('Magic Defense bonus: %i ', target:getMod(invaderXim.mod.MDEF)), invaderXim.msg.channel.SYSTEM_3)

            return
        end,

        ['elements'] = function()
            local eleMessages = {}
            for k, v in pairs(invaderXim.element) do
                if v > 0 then
                    local message = k
                    -- Right padding to line up lines (not perfect as the font )
                    for i = 1, 8 do
                        if string.len(k) < i then
                            message = ' ' .. message .. ' '
                        end
                    end

                    message = message .. ' SDT: ' ..         target:getMod(invaderXim.combat.element.getElementalSDTModifier(v))
                    message = message .. ' resRank: ' ..     target:getMod(invaderXim.combat.element.getElementalResistanceRankModifier(v))
                    message = message .. ' Null%: ' ..       target:getMod(invaderXim.combat.element.getElementalNullificationModifier(v))
                    message = message .. ' Absorb%: ' ..     target:getMod(invaderXim.combat.element.getElementalAbsorptionModifier(v))
                    message = message .. ' MEva: ' ..        target:getMod(invaderXim.combat.element.getElementalMEVAModifier(v))
                    eleMessages[v] = message
                end
            end

            -- Because pairs(invaderXim.element) doesn't guarantee order
            for _, message in ipairs(eleMessages) do
                player:printToPlayer(message, invaderXim.msg.channel.SYSTEM_3)
            end

            if targetType == invaderXim.objType.MOB then
                -- Print immunities
                local printString = 'Immunities:'
                local hasImmunities = false
                for k, v in pairs(invaderXim.immunity) do
                    if v > 0 then
                        if target:hasImmunity(v) then
                            printString = printString .. ' ' .. k
                            hasImmunities = true
                        end
                    end
                end

                if not hasImmunities then
                    printString = printString .. ' None'
                end

                player:printToPlayer(printString, invaderXim.msg.channel.SYSTEM_3)
            end

            return
        end,

        ['default'] = function()
            -- Not found in switch statement, so we didn't match an option
            local printString = 'Please choose a report type:'
            for k, v in ipairs(options) do
                printString = printString .. ' ' .. v .. '-' .. k
            end

            player:printToPlayer(printString)
            player:printToPlayer('Example: !getstats base or !getstats 1')
        end,
    }
end

return commandObj
