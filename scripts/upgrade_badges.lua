local ownerships = { "blueprint", "brainstorm", "SPL_draw_full" }
-- Effarcire is loaded AFTER SparkLatro so I can't take ownership yet...
-- honestly im too lazy to go back and put the other badges in so what im gonna do is put them here
for i, key in ipairs(ownerships) do
    SMODS.Joker:take_ownership(key, {
        set_badges = function(self, card, badges)
            badges[#badges + 1] = create_badge({ localize("k_upgradable"), "+SparkLatro" })
        end
    }, true) -- the last true makes it silent so that it doesnt show modbadge
end
