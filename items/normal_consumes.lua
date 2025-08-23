if SPL.config.consumables then
SMODS.Consumable{
    key="theentiredeck",
    set="Planet",
    atlas="theentiredeck",
    pos = {x=0,y=0},
    config = { hand_types = { "SPL_The Entire Deck" }}, -- I don't know why, but it needs to be SPL_The Entire Deck.
    can_use = function(self, card) -- this is important i think
		return true
	end,
	in_pool = function(self,args)
		return G.GAME.played_entire_deck or false
	end,
    loc_vars =function(self,info_queue,center)
        local entiredeck = G.GAME.hands["SPL_The Entire Deck"].level or 1
        local color = G.C.HAND_LEVELS[math.min(entiredeck, 7)]
        if entiredeck == 1 then
            planetcolourone = G.C.UI.TEXT_DARK
        end
        return {
			vars = {
				localize("k_spl_hand_entire_deck"),
				G.GAME.hands["SPL_The Entire Deck"].level,
				G.GAME.hands["SPL_The Entire Deck"].l_mult,
				G.GAME.hands["SPL_The Entire Deck"].l_chips,
				colours = { 
					to_big(G.GAME.hands["SPL_The Entire Deck"].level) == to_big(1) and G.C.UI.TEXT_DARK
					or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["SPL_The Entire Deck"].level)):to_number()] 
				},
			},
		}
    end,
    use = function(self, card, area, copier)
		suit_level_up(self, card, area, copier)
	end,
	bulk_use = function(self, card, area, copier, number)
		suit_level_up(self, card, area, copier, number)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and context.joker_main
			and (
				context.scoring_name == "entireDeck"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
SMODS.Consumable{
	key="spark_seal_spectral",
	set="Spectral",
	atlas="sealspectrals",
	pos = {x=0,y=1},
	config = {
		-- apparently this adds a tooltip
		mod_conv = "SPL_spark_seal",
		selected_card_number = 1
	},
	loc_vars = function(self,info_queue,card)
		-- add spark seal tooltip 
		info_queue[#info_queue + 1] = G.P_SEALS.SPL_spark_seal
		return {
			vars = {
				self.config.selected_card_number
			} 
		}
	end,
	can_use = function(self,card)
		if #G.hand.highlighted > 0 then
			return true
		end
	end,
	use = function(self,card,area,copier)
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			-- im not even gonna use the event manager cause i dont like it
			-- why? deal with it
			highlighted:flip()
			highlighted:set_seal("SPL_spark_seal")
			highlighted:flip()		
		end
	end,
}
SMODS.Consumable{
	key="ducky_seal_spectral",
	set="Spectral",
	atlas="sealspectrals",
	pos = {x=0,y=0},
	soul_pos = {x=1,y=0},
	config = {
		-- apparently this adds a tooltip
		mod_conv = "SPL_ducky_seal",
		selected_card_number = 1
	},
	loc_vars = function(self,info_queue,card)
		-- add ducky seal tooltip 
		-- this can be done SPECFICALLY because i added the seals to the avaliables for tooltips
		info_queue[#info_queue + 1] = G.P_SEALS.SPL_ducky_seal
		return {
			vars = {
				self.config.selected_card_number
			} 
		}
	end,
	can_use = function(self,card)
		if #G.hand.highlighted > 0 then
			return true
		end
	end,
	use = function(self,card,area,copier)
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			-- im not even gonna use the event manager cause i dont like it
			-- why? deal with it
			highlighted:flip()
			highlighted:set_seal("SPL_ducky_seal")
			highlighted:flip()		
		end
	end,
}
SMODS.Consumable{
	key="upgrade_spectral",
	set="Spectral",
	loc_vars = function(self,info_queue,card)
		if SPL.config.show_tooltips then
            info_queue[#info_queue+1] = {key = 'SPL_upgrade_list', set = 'Other'}
        end
	end,
	can_use = function(self,card,area,copier)
		-- check if a joker is highlighted
		if #G.jokers.highlighted <= 0 then -- why <= ? because i can. maybe something lets you highlight negative jokers?
			return false
		end
		if SparkLatro.upgrades[G.jokers.highlighted[1].config.center_key] then
			return true
		end
	end,
	use = function(self,card,area,copier)
		for _, value in ipairs(G.jokers.highlighted) do
			G.jokers:remove_card(value)
			value:remove()
			value = nil
			local card = SMODS.create_card({
				set = "Joker",
				area = G.jokers,
				key = "j_SPL_watermelonreactor"
			})
			card:add_to_deck()
			G.jokers:emplace(card)
			return true
		end
	end
}
end
