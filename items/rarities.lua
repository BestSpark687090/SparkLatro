SMODS.Rarity {
    key = "rareplus",
    badge_colour = HEX("9C2010"),
    pools = { ["Joker"] = true },
    get_weight = function(self, weight, object_type)
        return 0.003
    end,
}
SMODS.Rarity {
    key = "watermelon",
    badge_colour = HEX("22b14c"),
    pools = { ["Joker"] = true },
    get_weight = function(self, weight, object_type)
        return 0.0003
    end
}
SMODS.Rarity {
    key = "rareplusplus",
    badge_colour = HEX("FF0000"),
    pools = { ["Joker"] = true },
    get_weight = function(self, weight, object_type)
        return 0.00003 -- well there's definetly a common theme here
    end
}
