--TODO: actually make some custom consumables lol
if SPL.config.custom_consumables then
    SMODS.ConsumableType {
        key = "randoms",
        primary_colour = HEX("FE8D94"),
        secondary_colour = HEX("FFCDD2"),
        default = "c_wheel_of_fortune",
        shop_rate = 0.0,
        -- The loc txt is really weird just for this. it's b_[key]_cards
        collection_rows = { 4, 4 }, -- 4 pages for all code cards
        can_stack = true,
        can_divide = true,
        select_card = "consumeables",
        loc_txt = {}
    }
    SMODS.Consumable {
        key = "balala",
        discovered = true,
        unlocked = true,
        set = "randoms",
        atlas = "balala_atlas",
        display_size = { w = 219, h = 52 },
        -- pixel_size = { w = 219, h = 52 },
        use = function(self, card, context)
            return {
                message = "balala",
                colour = G.C.RARITY.rarePlus,
            }
        end
    }
end
