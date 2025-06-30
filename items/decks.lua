if SPL.config.decks then
SMODS.Back{
    name = "Flush Five Build",
    key = "ffive",
    pos = {x = 1, y = 3},
    config = {only_one_rank = 'King',only_one_suit="Diamonds"},
    loc_txt = {
        name ="Flush Five Build",
        text={
            "Start with a Deck",
            "full of ",
            "{C:attention,T:e_polychrome}Polychrome{},{C:inactive,T:m_steel}Steel{},{C:red,T:Red}Red Seal{}",
            "{E:1,C:diamonds}#1# of #2#{}",
        },
    },
    loc_vars = function(this,__,___)
        return {vars =  {
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
                    G.playing_cards[i]:set_seal("Red",true,true)
                    assert(SMODS.change_base(card, self.config.only_one_suit, self.config.only_one_rank))
                end
                return true
            end
        }))
    end
}
end