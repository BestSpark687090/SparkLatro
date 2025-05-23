SMODS.Achievement{
    key = "how",
    loc_txt = {
        name="what how",
        description = "somehow play the entire deck i guess"
    },
    atlas = "achieve",
    reset_on_startup=true,
    pos = {x=1,y=0},
    hidden_pos = {x=0,y=0},
    unlock_condition = function(self,args)
        if args.handname == "SPL_The Entire Deck" then
            return true
        end
    end
}