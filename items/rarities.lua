SMODS.Rarity{
    key="rareplus",
    badge_colour = HEX("9C2010"),
    pools = {["Joker"] = true},
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
SMODS.Rarity{
    key="watermelon",
    badge_colour = G.C.GREEN,
    pools = {["Joker"] = true},
    get_weight = function(self,weight,object_type)
        return weight
    end
}