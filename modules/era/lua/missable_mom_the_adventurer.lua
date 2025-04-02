-----------------------------------
-- Module to make 'Mom the Adventurer?' quest missable.
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('missable_mom_the_adventurer')

m:addOverride('invaderXim.server.onServerStart', function()
    super()

    invaderXim.module.modifyInteractionEntry('scripts/quests/bastok/Mom_the_Adventurer', function(quest)
        quest.sections[1].check = function(player, status, vars)
            return status ~= invaderXim.questStatus.QUEST_ACCEPTED and
                player:getFameLevel(invaderXim.fameArea.BASTOK) < 2 and
                vars.Prog == 0
        end
    end)
end)

return m
