-- stolen from cryptid (im too lazy)
function suit_level_up(center, card, area, copier, number)
	local used_consumable = copier or card
	if not number then
		number = 1
	end
	for _, v in pairs(card.config.center.config.hand_types) do
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(v, "poker_hands"),
			chips = G.GAME.hands[v].chips,
			mult = G.GAME.hands[v].mult,
			level = G.GAME.hands[v].level,
		})
		level_up_hand(used_consumable, v, nil, number)
	end
	update_hand_text(
		{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
		{ mult = 0, chips = 0, handname = "", level = "" }
	)
end
function Custom_table_ret() 
    t = {}
    for i = 1, 52 do
        table.insert(t, {s="D",r="K"})    -- i could write this out but nobody wants to see that
    end
    return t
end