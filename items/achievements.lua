SMODS.Achievement{
    key = "how",
    loc_txt = {
        name="what how",
        description = "somehow play the entire deck i guess"
    },
    atlas = "achieve",
    reset_on_startup=true, -- TODO: remove once you've actually finished the mod lol
    pos = {x=1,y=0},
    hidden_pos = {x=0,y=0},
    unlock_condition = function(self,args)
        if args.handname == "SPL_The Entire Deck" then
            return true
        end
    end
}
SMODS.Achievement{
    key="touch_grass",
    atlas="achieve",
    -- hidden_text = true,
    -- reset_on_startup = true, -- TODO: remove once you've actually finished the mod lol
    pos={x=1,y=0},
    hidden_pos={x=0,y=0},
    unlock_condition = function(self,args)
        if args.type == "SPL_touch_grass" then
            print("unlocked with the prefix")
            return true
        end
    end
}