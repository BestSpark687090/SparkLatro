if SPL.config.jokers then
-- Draw Full
SMODS.Joker{
    key="draw_full",
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
        info_queue[#info_queue+1] = {key = 'SPL_ideaby', set = 'Other', vars = { "Javapeoplebelike and tacovr123",0.7 }}
        local dangerRound = G.C.TEXT_DARK
        if card.ability.extra.rounds == 1 then dangerRound = G.C.RED end
        return {
            vars = {
                card.ability.extra.rounds,
                colours = {
                    dangerRound,
                    G.C.ETERNAL
                }
            }
        }
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            if card.ability.extra.rounds == 0 then
                -- print("this is supposed to die")
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        jok_id = i
                    end
                end
                if jok_id ~= 1 then -- check if it isnt the first one in the jokers
                    print("Is not the first Joker")
                    G.jokers.cards[jok_id-1]:start_dissolve()
                    G.jokers.cards[jok_id-1] = nil
                end
                if jok_id ~= #G.jokers.cards then -- check if it isnt the last joker
                    print("Is not the last Joker")
                    print(G.jokers.cards)
                    G.jokers.cards[jok_id+1]:start_dissolve()
                    G.jokers.cards[jok_id+1] = nil
                end
                -- then we remove us
                G.jokers:remove_card(card)
                card:remove()
                card = nil
                return {
                    message="kaboom",
                    colour=G.C.RED
                }
            elseif card.ability.extra.rounds < 0 then 
                error("this isn't supposed to happen. caused by j_spl_duck_bomb") -- lets go that actually works
            end
        end
    end
}
-- Jester's Regret
SMODS.Joker{
    key="jesters_regret",
    rarity=1,
    cost=2,
    blueprint_compat = true,
    config = {
        extra = {
            chips = 77,
            mult = 77,
        }
    },
    atlas="jestersregret",
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {key = 'SPL_ideaby', set = 'Other', vars = { "!TingTummyTrouble",0.5 }}
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = -card.ability.extra.mult
            }
        end
    end
}
-- backwards blueprint (tnirpeulb)
SMODS.Joker{
    key="tnirpeulb",
    rarity="SPL_rareplus",
    -- rarity=3,
    cost=5,
    atlas="tnirpeulb",
    pos={x=0,y=0},
    blueprint_compat=true, -- thankfully it doesnt do inf retriggers ig
    -- taken from cryptid, modified one character :P
    update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker = G.jokers.cards[i - 1]
				end
			end
			if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat then
				card.ability.blueprint_compat_ui = " elbitapmoc "
                card.ability.blueprint_compat = "compatible"
            else
                card.ability.blueprint_compat = "incompatible"
				card.ability.blueprint_compat_ui = " elbitapmocni "
			end
		end
	end,
    -- same with this, but removed the vars since it doesnt need any
    loc_vars = function(self, info_queue, card)
        if card.area and card.area ~= G.jokers then
            info_queue[#info_queue+1] = {generate_ui = generate_tooltip, key = 'rareplus', set="rarity", colour = G.C.RARITY.rarePlus, hasBGColour = true, text_colour = G.C.WHITE}
        end
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui
		card.ability.blueprint_compat_check = nil
		return {
			main_end = (card.area and card.area == G.jokers) and {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = {
								ref_table = card,
								align = "m",
								--colour = HEX("B43D6D"), -- this took me a moment but i got the hex code of the exact inversion of G.C.GREEN
                                -- never mind it sets it back to green if i move it :(
                                colour = G.C.GREEN,
								r = 0.05,
								padding = 0.06,
								func = "blueprint_compat",
							},
							nodes = {
								{
									n = G.UIT.T,
									config = {
										ref_table = card.ability,
										ref_value = "blueprint_compat_ui",
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.32 * 0.8,
									},
								},
							},
						},
					},
				},
			} or nil,
		}
	end,
    calculate = function(self,card,context)
        local other_joker = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				other_joker = G.jokers.cards[i - 1]
			end
		end
		if other_joker and other_joker ~= card then
			context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
			context.blueprint_card = context.blueprint_card or card

			if context.blueprint > #G.jokers.cards + 1 then
				return
			end

			local other_joker_ret, trig = other_joker:calculate_joker(context)
			local eff_card = context.blueprint_card or card

			context.blueprint = nil
			context.blueprint_card = nil

			if other_joker_ret == true then
				return other_joker_ret
			end
			if other_joker_ret or trig then
				if not other_joker_ret then
					other_joker_ret = {}
				end
				other_joker_ret.card = eff_card
				other_joker_ret.colour = darken(G.C.BLUE, 0.3)
				other_joker_ret.no_callback = true
				return other_joker_ret
			end
		end
    end,
}
-- Reverse Brainstorm (Mrotsniarb)
SMODS.Joker{
    key="mrotsniarb",
    rarity="SPL_rareplus",
    cost=5,
    blueprint_compat=true,
    atlas="mrotsniarb",
    pos = {x=0,y=0},
    update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker = G.jokers.cards[#G.jokers.cards]
				end
			end
			if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat then
				card.ability.blueprint_compat_ui = " elbitapmoc "
                card.ability.blueprint_compat = "compatible"
            else
                card.ability.blueprint_compat = "incompatible"
				card.ability.blueprint_compat_ui = " elbitapmocni "
			end
		end
	end,
    loc_vars = function(self, info_queue, card)
        if card.area and card.area ~= G.jokers then
            info_queue[#info_queue+1] = {generate_ui = generate_tooltip, key = 'rareplus', set="rarity", colour = G.C.RARITY.rarePlus, hasBGColour = true, text_colour = G.C.WHITE}
        end
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui
		card.ability.blueprint_compat_check = nil
		return {
			main_end = (card.area and card.area == G.jokers) and {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = {
								ref_table = card,
								align = "m",
								--colour = HEX("B43D6D"), -- this took me a moment but i got the hex code of the exact inversion of G.C.GREEN
                                -- never mind it sets it back to green if i move it :(
                                colour = G.C.GREEN,
								r = 0.05,
								padding = 0.06,
								func = "blueprint_compat",
							},
							nodes = {
								{
									n = G.UIT.T,
									config = {
										ref_table = card.ability,
										ref_value = "blueprint_compat_ui",
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.32 * 0.8,
									},
								},
							},
						},
					},
				},
			} or nil,
		}
	end,
}
--Chutes and Ladders
SMODS.Joker{
    key="chutesandladders",
    rarity = 2,
    cost = 5,
    atlas="chutesandladders",
    pos = {x=0,y=0},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {key = 'SPL_ideaby', set = 'Other', vars = { "Brodizzle",0.5 }}
    end,
    calculate = function(self,card,context)
        if context.before and context.cardarea == G.jokers then
	        for i=1, #G.play.cards do
                G.E_MANAGER:add_event(Event({trigger="after",delay=0.3,func = function()
                    local _card = G.play.cards[i]
                    _card:flip()
                return true end}))
                -- This took me forever to figure out. I finally did it! :Yippee:
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3,func = function()
                    local _card = G.play.cards[i]
                    beforeNominal = _card.base.nominal
                    local success, err = SMODS.modify_rank(_card, 1)
                    assert(success, "Failed to change card rank: " .. (err or "unknown error"))
                    afterNominal = _card.base.nominal
					_card:juice_up(0.5, 0.5)
					play_sound('tarot1')
                return true end }))
                G.E_MANAGER:add_event(Event({trigger="after",delay=0.3,func = function()
                    local _card = G.play.cards[i]
                    _card:flip()
                return true end}))
            end
            return {
                message = localize("k_rankup_ex")
            }
	    end
    end
}
end
