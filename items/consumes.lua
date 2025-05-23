SMODS.Consumable{
    key="theentiredeck",
    set="Planet",
    atlas="theentiredeck",
    pos = {x=0,y=0},
    config = { hand_types = { "SPL_The Entire Deck" }}, -- I don't know why, but it needs to be SPL_The Entire Deck.
    can_use = function(self, card) -- this is important i think
		return true
	end,
    loc_vars =function(self,info_queue,center)
        local entiredeck = G.GAME.hands["SPL_The Entire Deck"].level or 1
        local color = G.C.HAND_LEVELS[math.min(entiredeck, 7)]
        if entiredeck == 1 then
            planetcolourone = G.C.UI.TEXT_DARK
        end
        return {
			vars = {
                "The Entire Deck",
				entiredeck,
				colours = { planetcolourone },
			},
		}
    end,
    loc_txt = {
        name="The Entire Deck, but as a Planet for some reason",
        text={
            "(lvl.1) Level up",
            "{C:attention}#1#{}",
            "{C:mult}5.252e18{} Mult and",
            "{C:chips}5.252e18{} Chips"
        }
    },
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