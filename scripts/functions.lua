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
		table.insert(t, { s = "D", r = "K" }) -- i could write this out but nobody wants to see that
	end
	return t
end

-- yoinked from ortalab
function generate_tooltip(_c, info_queue, card, desc_nodes, specific_vars, full_UI_table)
	local d_nodes = desc_nodes
	d_nodes['colour'] = _c.colour
	d_nodes["gimme_bg_colours"] = _c.hasBGColour
	d_nodes['text_colour'] = _c.text_colour
	d_nodes["title"] = G.localization.descriptions[_c.set][_c.key]['name']
	localize { type = 'descriptions', set = _c.set, key = _c.key or "rareplus", nodes = d_nodes, vars = specific_vars or _c.vars }
end

-- same here
local itfr = info_tip_from_rows
function info_tip_from_rows(desc_nodes, name)
	if desc_nodes.gimme_bg_colours then
		local t = {}
		for k, v in ipairs(desc_nodes) do
			local vnew = v
			v[1]['config']['colour'] = desc_nodes.text_colour or G.C.UI.TEXT_LIGHT
			t[#t + 1] = { n = G.UIT.R, config = { align = "cm" }, nodes = v }
		end
		sprite = Sprite(0, 0, 1, 1, G.ASSET_ATLAS["SPL_mrotsniarb"], { x = 0, y = 0 })
		return {
			n = G.UIT.R,
			config = { align = "cm", colour = darken(desc_nodes.colour, 0.15), r = 0.1 },
			nodes = {
				{
					n = G.UIT.R,
					config = { align = "tm", minh = 0.36, padding = 0.03 },
					nodes = { { n = G.UIT.T, config = { text = desc_nodes.title, scale = 0.32, colour = G.C.UI.TEXT_LIGHT } } }
				}, -- Title Spot at the Top
				{ n = G.UIT.R, config = { align = "cm", minw = 1.5, minh = 0.4, r = 0.1, padding = 0.05, colour = desc_nodes.colour, 0.5 }, nodes = { { n = G.UIT.R, config = { align = "cm", padding = 0.03 }, nodes = t } } }
			}
		}
	else
		return itfr(desc_nodes, name)
	end
end
