return {
    misc = {
        dictionary = {
            k_spl_rareplus = "Rare+",
            k_rankup_ex = "Rank Up!"
        },
        labels = {
            k_spl_rareplus = "Rare+",
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
            }
        },
        Other = {
            SPL_ideaby = {
                name = "Joker idea by",
                text = {
                    "{s:#2#,E:1,C:inactive}#1#{}"
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
        }
    },
}