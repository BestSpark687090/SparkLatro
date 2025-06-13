return {
    misc = {
        dictionary = {
            k_spl_rareplus = "Rare+",
            k_rankup_ex = "Rank Up!",
            k_spl_watermelon = "Watermelon",
            k_spl_hand_entire_deck = "The Entire Deck"
        },
        labels = {
            spl_spark_seal_seal = "Spark Seal",
            spl_ducky_seal_seal = "Ducky Seal"
        },
        achievement_names={
            ach_SPL_touch_grass = "Touch Grass"
        },
        achievement_descriptions={
            ach_SPL_touch_grass = "Touch the Grass. It's shrimple."
        }
    },
    -- c_entireity = "Entire Deck Thingy",
    -- c_perkeo = "Perkeo?"
    descriptions={
        Joker = {
            j_SPL_draw_full = {
                name="Draw Full",
                text = {
                    "Draw {C:attention}literally your entire deck{} into your hand.",
                    "{X:chips,C:white}^2{} {C:chips}Chips{} and {X:mult,C:white}^2{} {C:mult}Mult{} if you play The Entire Deck.",
                    "{C:inactive}Also, lets you select your entire deck.{}",
                },
            },
            j_SPL_duck_bomb = {
                name="Duck with a Bomb",
                text = {
                    "In {V:1}#1#{} rounds, {C:attention}destroy",
                    "this joker and {C:attention}the ",
                    "{C:attention}others around it",
                    "{C:red,S:2}Can destroy {B:2,C:white}Eternal{C:red} Jokers",
                    "{s:0.5,C:inactive}Idea by Javapeoplebelike and tacovr123"
                }
            },
            j_SPL_jesters_regret = {
                name="Jimbo's Regret",
                text={
                    "{C:chips}+#1# Chips{}, {C:mult}-#2# Mult{}",
                    "{s:1.1,C:inactive}\"He laughed... then cried.\"",
                    "{C:inactive,s:0.7}(You... probably shouldn't take this.)",
                    "{s:0.5,C:inactive}Idea by !TingTummyTrouble"
                }
            },
            j_SPL_expired_coupon = {
                name="Expired Coupon",
                text={
                    "{X:chips}x2{C:chips} Chips{}, but only if",
                    "your hand scores {C:attention}less than 1,000 chips.{}",
                    "{s:0.5,C:inactive}Idea by !TingTummyTrouble"
                }
            },
            j_SPL_spongebop = {
                name="SpongeBop",
                text={
                    "Shouts randomly, and gains {C:mult}+1 mult{}",
                    "each time he shouts.",
                    "{C:inactive}(Currently #1# Mult)",
                    "{s:0.5,C:inactive}Idea by !TingTummyTrouble"
                }
            },
            j_SPL_tnirpeulb = {
                name = "Tnirpeulb",
                text={
                    "Copies ability of",
                    "{C:attention}Joker{} to the left"
                }
            },
            j_SPL_mrotsniarb = {
                name = "Mrotsniarb",
                text = {
                    "Copies the ability",
                    "of rightmost {C:attention}Joker{}"
                }
            },
            j_SPL_chutesandladders = {
                name = "Chutes and Ladders",
                text = {
                    "Increases the rank",
                    "of all {C:attention}scored and unscored cards{}"
                }
            },
            j_SPL_watermelonreactor = {
                name = "Watermelon Reactor",
                text = {
                    "The one, the only:",
                    "{s:2,B:1,C:green,E:1}Watermelon Reactor!",
                    "{C:inactive}(Gives +100 Chips and Mult,",
                    "{C:inactive}and also x100 Chips and Mult.)",
                    "{s:0.5,C:inactive}Why that much? Because why not!!"
                }
            },
            j_SPL_ducky = {
                name = "{V:1,E:1}Ducky{}",
                text = {
                    "It's the Ducky!!"
                }
            }
        },
        Planet = {
            c_SPL_theentiredeck = {
                name="The Entire Deck, but as a Planet for some reason",
                text={
                    "(lvl.#2#) Level up",
                    "{C:attention}#1#{}",
                    "{C:mult}#3#{} Mult and",
                    "{C:chips}#4#{} Chips"
                }
            }
        },
        Spectral = {
            c_SPL_spark_seal_spectral = {
                name = "Spark Seal",
                text = {
                    "Add a {T:spark_seal}Spark Seal",
                    "to {C:attention}#1#{} selected",
                    "card in your hand"
                }
            },
            c_SPL_ducky_seal_spectral = {
                name = "{E:1}Ducky Seal",
                text = {
                    "Add a {T:ducky_seal}Ducky Seal",
                    "to {C:attention}#1#{} selected",
                    "card in your hand"
                }
            }
        },
        Other = {
            -- has to be lowercase cause of... reasons i guess
            spl_spark_seal_seal = {
                name = "Spark Seal",
                text = {
                    "Gives random bonuses.",
                    "Fixed 1 in 10 chance for each of these:",
                    "{C:mult}+Mult{}, {X:mult,C:white}xMult{}, {C:chips}+Chips{}, {X:chips,C:white}xChips{},",
                    "Swap {C:mult}Chips{} and {C:chips}Mult{}, {V:1}Balance{} {C:chips}Chips{} and {C:mult}Mult{},",
                    "{X:dark_edition,C:chips}^Chips{}, {X:dark_edition,C:mult}^Mult{}, {C:money}+${}, {C:planet}Level up Hand{}",
                    "{C:edition,E:1}Now this is where the fun begins.{}" -- Dang i like this quote
                }
            },
            spl_ducky_seal_seal = {
                name = "Ducky Seal",
                text = {
                    "The seal of Ducky.",
                    "He approves.",
                    "Gives... bonuses.",
                    "{s:0.5}#6# in #1# odds to give you the Legendary Ducky",
                    "{s:0.5}and gives you {C:mult,s:0.5}+#3#{s:0.5} mult and",
                    "{X:mult,s:0.5}x#5#{s:0.5} mult when you hit the odds",
                    "{s:0.5}Otherwise, gives {C:mult,s:0.5}+#2#{s:0.5} Mult and",
                    "{X:mult,s:0.5}x#3#{s:0.5} Mult",
                    "{C:inactive}The text above is purposefully hard to read,",
                    "{C:inactive}but is still readable.{}"
                }
            },
            SPL_ideaby = {
                name = "Joker idea by",
                text = {
                    "{s:#2#,E:1,C:inactive}#1#{}"
                }
            },
            SPL_watermelon_reactor_lore = {
                name = "Watermelon Reactor Lore",
                text = {
                    "To start, Watermelon Reactor is a",
                    "Discord bot I made which reacts",
                    "with the watermelon emoji to every",
                    "message sent. Seems weird, but there's",
                    "a reason. It's used to see",
                    "who has read the message, and",
                    "who has not. This came from",
                    "a friend's server of mine, where",
                    "they were doing it manually. I",
                    "came along and decided to make",
                    "a Discord bot for them, so",
                    "they can react faster than they",
                    "could without the bot.",
                }
            },
            SPL_watermelon_reactor_bot_link = {
                name = "Link to the Watermelon Reactor top.gg site",
                text = {
                    "https://top.gg/bot/1228469171826987040"
                }
            },
            SPL_draw_full_placeholder = {
                name = "Technically a Placeholder",
                text = {
                    "Technically, this entire joker is a",
                    "placeholder. It was just for testing,",
                    "but I decided to keep it in here anyways."
                }
            },
        },
        rarity = {
            rareplus = {
                name = "Rare+",
                text = {
                    "Rare+ is a rarity above Rare",
                    "implemented by SparkLatro.",
                    "They might be better than the",
                    "normal Rare jokers, but you ",
                    "gotta figure that out yourself!"
                }
            }
        },
    },

}