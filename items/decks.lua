if SPL.config.decks then
    SMODS.Back {
        name = "Flush Five Build",
        key = "ffive",
        pos = { x = 1, y = 3 },
        config = { only_one_rank = 'King', only_one_suit = "Diamonds" },
        loc_vars = function(this, __, ___)
            return {
                vars = {
                    this.config.only_one_rank,
                    this.config.only_one_suit
                }
            }
        end,

        apply = function(self)
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i, card in ipairs(G.playing_cards) do
                        G.playing_cards[i]:set_ability(G.P_CENTERS.m_steel)
                        G.playing_cards[i]:set_edition({
                            polychrome = true
                        }, true, true)
                        G.playing_cards[i]:set_seal("Red", true, true)
                        assert(SMODS.change_base(card, self.config.only_one_suit, self.config.only_one_rank))
                    end
                    return true
                end
            }))
        end
    }
    SMODS.Back {
        name = "Absolute Cinema",
        key = "cinema",
        atlas = "cinema_atlas",
        -- loc_vars = function()
        --     info_queue[#info_queue+1] = {}
        -- end
        apply = function(self)
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i, card in ipairs(G.playing_cards) do
                        G.playing_cards[i]:set_seal("SPL_spark_seal", true, true)
                    end
                    return true
                end
            }))
        end
    }
end
