if SPL.config.jokers then
-- Draw Full
SMODS.Joker{
    key="draw_full",
    loc_txt={
        name="Draw Full",
        text = {
            "Draw {C:attention}literally your entire deck{} into your hand.",
            "{X:chips,C:white}^2{} {C:chips}Chips{} and {X:mult,C:white}^2{} {C:mult}Mult{} if you play The Entire Deck.",
            "{C:inactive}Also, lets you select your entire deck.{}",
        }
    },
    rarity = 3,
    atlas="spark",
    pos = { x = 0, y = 0 },
    config = {extra = 52, other = {chips_exp = 2,mult_exp = 2}},
    center = {config = {extra = 52},},
    cost = 52,
    loc_vars = function(self, info_queue)
		return { vars = {self.config.chips_exp, self.config.mult_exp } }
	end,
    calculate = function(self, card, context)
		if not context.blueprint and not context.retrigger_joker then
			if context.first_hand_drawn then
				G.FUNCS.draw_from_deck_to_hand(#G.deck.cards)
				return nil, true
			elseif G.hand.config.card_limit < 1 then
				G.hand.config.card_limit = 1
			end
		end
        -- if context.joker_main then
        -- if context.before and next(context.poker_hands['entireDeck']) then
        --     playedEntireDeck = true
        -- end
        if context.joker_main then
            if playedEntireDeck then
                playedEntireDeck = false
                -- context.mult = context.mult ^ self.config.mult_exp
                -- context.chips = context.chips ^ self.config.chips_exp
                self.config.chips_exp = 2
                self.config.mult_exp = 2
                return{
                    message="^2 Mult and ^2 Chips!!",
                    Echip_mod = self.config.chips_exp,
                    Emult_mod = self.config.mult_exp
                }
            else
                playedEntireDeck = false
            end
            return{
                message="Nope!"
            }

        end
	end,
    add_to_deck = function(self,card,from_debuff)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
		+ math.max(1, math.floor(self.config.extra))
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
		- math.max(1, math.floor(self.config.extra))
    end
}
-- Duck with a Bomb
SMODS.Joker{
    key="duck_bomb",
    rarity = 2,
    -- Localization's in the en-us.lua script. Figured it out :)
    cost = 5,
    atlas="duckbomb",
    pos = {x=0,y=0},
    blueprint_compat=false,
    eternal_compat=false,
    perishable_compat=false,
    config = {
        extra = {
            rounds = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local dangerRound = G.C.TEXT_DARK
        if card.ability.extra.rounds == 1 then dangerRound = G.C.RED end
        return {
            vars = {
                card.ability.extra.rounds,
                colours = {
                    dangerRound
                }
            }
        }
    end
}
end
