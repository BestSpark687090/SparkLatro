SMODS.Seal{
    key="spark_seal",
    atlas="sparkseal",
    pos = {x=0,y=0},
    badge_colour = HEX("FF0000"),
    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                colours = {
                    {0.8, 0.45, 0.85, 1},
                    G.C.DARK_EDITION
                }
            }
        }
    end,
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.play then
            -- stuff we can do probably:
            --[[
            +Mult
            XMult
            +Chips
            XChips(Would have to have Talisman installed [It's a requirement tho so])
            Swap Chips and Mult
            Balance it like Plasma Deck (Check how that happens)
            EMult (Double random value basically) uses hypermult_mod
            EChips (Double random value basically) uses hyperchips_mod
            Money
            Level up Hand
            ]]
            -- just as a note: yes i know. using tostring is kinda dum dum
            -- i honestly dont care as it gets the job done and makes it easier to type
            local outcome = pseudorandom("SPL_test",1,10)
            if outcome == 1 then
                -- pluschips
                local plus_chips = pseudorandom("SPL_sparkseal_plus_chips",1,20)
                return {
                    chips = plus_chips
                }
            elseif outcome == 2 then
                -- xchips
                local x_chips = pseudorandom("SPL_sparkseal_x_chips",1,5)
                return {
                    x_chips = x_chips
                }
            elseif outcome == 3 then
                -- swap
                return {
                    message = "Swapped Chips and Mult",
                    swap = true
                }
            elseif outcome == 4 then
                -- money
                local money_amount = pseudorandom("SPL_sparkseal_dollarydoes",1,10) -- why the goofy ahh name? funnies.
                return {
                    dollars = money_amount -- it adds the message automagically so :)
                }
            elseif outcome == 5 then
                -- level up hand
                local level_up_amount = pseudorandom("SPL_sparkseal_hand_lvl_up_amount",1,10)
                return {
                    message = "Leveled up played hand "..tostring(level_up_amount).." times",
                    level_up = level_up_amount -- or at least i think thats how this works
                }
            elseif outcome == 6 then
                -- balance it out
                -- taken from cryptid with good intentions
                local tot = hand_chips + mult
                if not tot.array or #tot.array < 2 or tot.array[2] < 2 then --below eXeY notation
                    hand_chips = mod_chips(math.floor(tot / 2))
                    mult = mod_mult(math.floor(tot / 2))
                else
                    if hand_chips > mult then
                        tot = hand_chips
                    else
                        tot = mult
                    end
                    hand_chips = mod_chips(tot)
                    mult = mod_chips(tot)
                end
                update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
                return {
                    message = localize("k_balanced"),
                    colour = { 0.8, 0.45, 0.85, 1 },
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            func = function()
                                play_sound("gong", 0.94, 0.3)
                                play_sound("gong", 0.94 * 1.5, 0.2)
                                play_sound("tarot1", 1.5)
                                -- literally make the colors balance or something
                                ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
                                ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
                                G.E_MANAGER:add_event(Event({
                                    trigger="after",
                                    delay="2",
                                    func = function()
                                        ease_colour(G.C.UI_CHIPS, G.C.BLUE,2)
                                        ease_colour(G.C.UI_MULT, G.C.RED, 2)
                                    end
                                }))
                                return true
                            end,
                        }))
                    end,
                }
            elseif outcome == 7 then
                -- plusmult
                local plus_mult = pseudorandom("SPL_sparkseal_plus_mult",1,20) -- in the range of a lucky card cause why not
                return {
                    mult = plus_mult
                }
            elseif outcome == 8 then
                -- xmult
                local x_mult = pseudorandom("SPL_sparkseal_x_mult",1,5) -- about 3.3x the amt of a polychrome card gives
                return{
                    xmult = x_mult
                }
            elseif outcome == 9 then -- Make the ^ mults low numbers cause the rolls usually hit high
                -- nevermind im entirely wrong they hit low so often
                -- Gives EChips
                local exponent = pseudorandom("SPL_sparkseal_echips_exponent",2,4)
                local amount = pseudorandom("SPL_sparkseal_echips_amount",1,10)
                local carats = string.rep("^",exponent)
                return {
                    message = carats..tostring(amount).." Chips!?!?",
                    hyperchip_mod = {exponent,amount}
                }
            elseif outcome == 10 then
                -- emult
                local exponent = pseudorandom("SPL_sparkseal_emult_exponent",2,4)
                local amount = pseudorandom("SPL_sparkseal_emult_amount",1,10)
                local carats = string.rep("^",exponent)
                return {
                    message = carats..tostring(amount).." Mult!?!?",
                    hypermult_mod = {exponent,amount}
                }
            end
            -- once it's done, reset the colors back

        end
    end
}
SMODS.Sound{
    key="ducky_sealsfx",
    path = 'ducky_seal.ogg',
    pitch = 0.8,
    volume = 1,
    sync = false
}
SMODS.Seal{
    key="ducky_seal",
    atlas="sparkseal",
    pos={x=1,y=0},
    badge_colour=HEX("FFFF00"),
    sound = {sound = "SPL_ducky_sealsfx",per=0.8,vol=1 },
    config = {
        extra = {
            odds_of_legendary = 100,
            plus_mult = 20,
            x_mult = 3,
            plus_mult_when_legendary = 100,
            x_mult_when_legendary = 100
        }
    },
    loc_vars = function(self,info_queue,card)
        return {
            vars =  {
                self.config.extra.odds_of_legendary,
                self.config.extra.plus_mult,
                self.config.extra.x_mult,
                self.config.extra.plus_mult_when_legendary,
                self.config.extra.x_mult_when_legendary,
                G.GAME.probabilities.normal or 1
            }
        }
    end,
    calculate = function(self, card, context)
        -- main_scoring context is used whenever the card is scored
        
        if context.main_scoring and context.cardarea == G.play then
            local legendarycheck = pseudorandom("SPL_Gain_Legendary_Ducky_Check",1,(100/(G.GAME.probabilities.normal or 1))) -- little funny chance :P
            if legendarycheck == 1 then
                return {
                    G.E_MANAGER:add_event(Event({func = function()
                    play_sound("polychrome1")
                    local card = create_card("Joker",G.jokers,true,4,nil,nil,"j_SPL_ducky","SPL_ducky_seal")
                    card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
                    return true end})),
                    message = "You got the Ducky!!",
                    colour = HEX("FFD800")
                }
            end
            return {
                G.E_MANAGER:add_event(Event({func = function()
                play_sound('SPL_ducky_sealsfx')
                return true end })),
                message = "Ducky!!!",
                colour = HEX("FFD800"),
                mult = self.config.extra.plus_mult,
                xmult = self.config.extra.x_mult
            }
        end
    end
}