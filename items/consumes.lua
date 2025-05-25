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
}
SMODS.Consumable{
	key="ducky_seal_spectral",
	set="Spectral",
	atlas="sealspectrals",
	pos = {x=0,y=0},
	soul_pos = {x=1,y=0}
}
end
