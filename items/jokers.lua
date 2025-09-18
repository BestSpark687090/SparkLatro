if SPL.config.jokers then
    -- Draw Full
    SMODS.Joker{
        discovered = true,
        unlocked = true,
        key="draw_full",
        rarity = "SPL_rareplus",
        atlas="spark",
        pos = { x = 0, y = 0 },
        config = {cards_added = 0, other = {chips_exp = 2,mult_exp = 2}},
        cost = 52,
        loc_vars = function(self, info_queue, card)
            if card.area and card.area ~= G.jokers and SPL.config.show_tooltips then
                info_queue[#info_queue+1] = {key = "SPL_draw_full_placeholder", set="Other"}
            end
            return { vars = {self.config.chips_exp, self.config.mult_exp } }
        end,
        calculate = function(self, card, context)
            if not context.blueprint and not context.retrigger_joker then
                if context.first_hand_drawn then
                    G.FUNCS.draw_from_deck_to_hand(#G.deck.cards)
                    return nil, true
                end
            end
            -- if context.joker_main then
            -- if context.before and next(context.poker_hands['entireDeck']) then
            --     playedEntireDeck = true
            -- end
            if context.joker_main then
                if playedEntireDeck or SparkLatro.alwaysCountTED then
                    playedEntireDeck = false
                    G.GAME.played_entire_deck = true
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
            -- you know i feel like this would be better
            SMODS.change_play_limit(1e6)
            SMODS.change_discard_limit(1e6)
        end,
        remove_from_deck = function(self,card,from_debuff)
            SMODS.change_play_limit(-1e6)
            SMODS.change_discard_limit(-1e6)
        end
    }
    -- Duck with a Bomb
    SMODS.Joker{
        discovered = true,
        unlocked = true,
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
            if SPL.config.show_tooltips then
                info_queue[#info_queue+1] = {key = 'SPL_ideaby', set = 'Other', vars = { "Javapeoplebelike and tacovr123",0.7 }}
            end
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
        discovered = true,
        unlocked = true,
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
            if SPL.config.show_tooltips then
                info_queue[#info_queue+1] = {key = 'SPL_ideaby', set = 'Other', vars = { "!TingTummyTrouble",0.5 }}
            end
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
        discovered = true,
        unlocked = true,
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
            if card.area and card.area ~= G.jokers and SPL.config.show_tooltips then
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
                    ---@diagnostic disable-next-line: return-type-mismatch
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
        discovered = true,
        unlocked = true,
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
            if card.area and card.area ~= G.jokers and SPL.config.show_tooltips then
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
                    other_joker = G.jokers.cards[#G.jokers.cards]
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
                    ---@diagnostic disable-next-line: return-type-mismatch
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
    --Chutes and Ladders
    SMODS.Joker{
        discovered = true,
        unlocked = true,
        key="chutesandladders",
        rarity = 2,
        cost = 5,
        atlas="chutesandladders",
        blueprint_compat = true,
        pos = {x=0,y=0},
        loc_vars = function(self,info_queue,card)
            if SPL.config.show_tooltips then
                info_queue[#info_queue+1] = {key = 'SPL_ideaby', set = 'Other', vars = { "Brodizzle",0.5 }}
            end
        end,
        calculate = function(self,card,context)
            if context.before and context.cardarea == G.jokers then
                for i=1, #G.play.cards do
                    G.E_MANAGER:add_event(Event({trigger="after",delay=0.3,func = function()
                        local _card = G.play.cards[i]
                        _card:flip()
                        return true end
                    }))
                    -- This took me forever to figure out. I finally did it! :Yippee:
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3,func = function()
                        local _card = G.play.cards[i]
                        beforeNominal = _card.base.nominal
                        local success, err = SMODS.modify_rank(_card, 1)
                        assert(success, "Failed to change card rank: " .. (err or "unknown error"))
                        afterNominal = _card.base.nominal
                        _card:juice_up(0.5, 0.5)
                        play_sound('tarot1')
                        return true end 
                    }))
                    G.E_MANAGER:add_event(Event({trigger="after",delay=0.3,func = function()
                        local _card = G.play.cards[i]
                        _card:flip()
                        return true end
                    }))
                end
                return {
                    message = localize("k_rankup_ex")
                }
            end
        end
    }
    SMODS.Joker{
        discovered = true,
        unlocked = true,
        key="watermelonreactor",
        rarity="SPL_watermelon",
        cost=0,
        atlas="watermelonreactor",
        pos={x=0,y=0},
        display_size = { w = 71, h = 71 },
        pixel_size = {w=71,h=71},
        loc_vars = function(self,info_queue,card)
            if card.area and card.area ~= G.jokers and SPL.config.show_tooltips then
                info_queue[#info_queue+1] = {key = 'SPL_watermelon_reactor_lore', set = 'Other'}
                info_queue[#info_queue+1] = {key = 'SPL_watermelon_reactor_bot_link', set = 'Other'}
            end
            return {
                vars = {
                    colours = {
                        G.C.RED
                    }
                }
            }
        end,
        calculate = function(self,card,context)
            if context.joker_main then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        local text = "🍉"
                        play_sound('gong', 0.94, 0.3)
                        play_sound('gong', 0.94*1.5, 0.2)
                        play_sound('tarot1', 1.5)
                        attention_text({
                            scale = 1.4, text = text, hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play,font=SMODS.Fonts["SPL_emoji"]
                        })
                        return true
                    end)
                }))
                return {
                    mult = 100,
                    chips = 100,
                    x_mult = 100,
                    x_chips = 100,
                }
            end
        end
    }
    
    SMODS.Joker{
        discovered = true,
        unlocked = true,
        key="ducky",
        rarity=4, -- The Legendary Ducky is here!,
        cost=10,
        atlas="ducky",
        blueprint_compat = true,
        pos = {x=0,y=0},
        soul_pos = {x=1,y=0},
        loc_vars = function(self,info_queue,card)
            G.ARGS.LOC_COLOURS["Ducky"] = HEX("FFD800")
            return {
                vars = {
                    colours = {
                        HEX("FFD800")
                    }
                }
            }
        end,
        calculate = function(self,card,context)
            if context.joker_main then
                return {
                    message= "h",
                    colour = HEX("FFD800"),
                    x_chips = 200,
                    x_mult = 200,
                }
            end
        end
    }
    -- The joker that lets you touch Grass fr fr
    SMODS.Joker{
        discovered = true,
        unlocked = true,
        key="grass_joker",
        rarity=1,
        cost=3,
        atlas="grass",
        no_doe=true, -- i believe this is the right way to disable it from deck of equlibrium
        pos={x=0,y=0},
        loc_vars = function(self,info_queue,card)
            -- yes the variables are not going to be used its fine
            check_for_unlock({type="SPL_touch_grass"})
        end,
        in_pool = function(self,args)
            return false, {allow_duplicates = false}
        end,
        add_to_deck = function(self,card,from_debuff)
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Was it just a dream?", colour = G.C.GREEN})
                -- G.jokers:remove_card(card) -- dont.
                card:start_dissolve()
                -- card = nil
                return true end
            }))
            
        end
    }
    -- ^0.05 mult and chips for each card in deck, hand always counts as The Entire Deck and copies all played cards
    -- idea by jamirror
    SMODS.Joker{
        discovered = true,
        unlocked = true,
        key="trick_deck",
        rarity="SPL_rareplusplus",
        atlas="trick_deck",
        blueprint_compat = true,
        pos={x=0,y=0},
        cost=104,
        config = {
            extra = {
                mult = 1,
            }
        },
        loc_vars = function(self,info_queue,card)
            if SPL.config.show_tooltips then
                info_queue[#info_queue+1] = {key = 'SPL_ideaby', set = 'Other', vars = { "jamirror",0.5 }}
            end
            if card.area and card.area ~= G.jokers and SPL.config.show_tooltips then
                info_queue[#info_queue+1] = {generate_ui = generate_tooltip, key = 'rareplusplus', set="rarity", colour = G.C.RARITY.rarePlusPlus, hasBGColour = true, text_colour = G.C.WHITE}
            end
            card.ability.extra.mult = 0.05*#G.playing_cards+1
            return {
                vars = {
                    card.ability.extra.mult
                }
            }
        end,
        add_to_deck = function(self,card,from_debuff)
            SparkLatro.alwaysCountTED = true
        end,
        remove_from_deck = function(self,card,from_debuff)
            SparkLatro.alwaysCountTED = false
        end,
        calculate = function(self,card,context)
            if context.joker_main then
                return {
                    message = "The deck got tricky! (I guess?)",
                    colour = G.C.RARITY.rarePlusPlus,
                    emult = card.ability.extra.mult,
                    Emult = card.ability.extra.mult, -- Just in case?,
                    func = function()
                        local highlighted = G.hand.highlighted
                        local copied = 0
                        for _, c in ipairs(context.scoring_hand) do
                            local card = copy_card(c)
                            card:add_to_deck()
                            table.insert(G.playing_cards, card)
                            G.hand:emplace(card)
                            playing_card_joker_effects({ card })
                            copied = copied + 1
                        end
                    end
                }
            end
        end
    }
    -- the one from the other collab guy, hurlemort i think
    SMODS.Joker{
        discovered = true,
        unlocked = true,
        key = "peak",
        config={ extra = { odds = 4 } },
        pos = { x = 0, y = 0 },
        soul_pos = { x = 1, y = 0 },
        rarity = 4,
        cost = 20,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        effect = nil,
        atlas = 'peak_atlas',
        pools = {["tao_joker_pool_legendary"] = true},
        loc_vars = function(self, info_queue, card)
            if not card.edition or (card.edition and not card.edition.negative) then
                info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
            end
            local count = 0
            if G.jokers and G.jokers.card then
                for i, v in ipairs(G.jokers.cards) do
                    if not v.edition or (not v.edition.negative) then
                        count = count + 1
                    end
                end
                card.ability.extra.odds = count
            else
                card.ability.extra.odds = 1
            end
            return { vars = {G.GAME.probabilities.normal, card.ability.extra.odds} }
        end,
        
        calculate = function(self, card, context)
            if (context.end_of_round and not context.repetition and not context.individual) and G.GAME.blind then
                if pseudorandom("peak") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    -- Find self's index
                    local self_index
                    for i, v in ipairs(G.jokers.cards) do
                        if v == card then
                            self_index = i
                            break
                        end
                    end
                    
                    -- Get the joker to the right
                    local right_joker = self_index and G.jokers.cards[self_index + 1] or nil
                    if right_joker and right_joker ~= card then
                        -- Apply negative edition to the right joker
                        right_joker:set_edition("e_negative")
                        return {
                            message = "Peak Fiction",
                            colour = G.C.DARK_EDITION,
                            card = right_joker,
                        }
                    end
                else
                    return {
                        message = "Nuh uh!",
                        colour = G.C.RED,
                    }
                end
            end
        end,
    }
end              