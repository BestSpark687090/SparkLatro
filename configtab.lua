function returnAMenu(menu_name)
    if menu_name == nil or menu_name == "Page 1" then
        return { n= G.UIT.ROOT, config = {r=0.1,align="cm",padding=0.5,colour=G.C.BLACK}, nodes = {{
            n=G.UIT.C,
            config={
                align="cm",
                padding=0.1,
                colour=G.C.BLACK,
            },
            nodes = {
                -- SparkLatro Config Label
                {n=G.UIT.R,config={colour=G.C.RED,minw=10,r=0,minh=0.75,align="cm"},nodes={
                    {n=G.UIT.T, config = {text="SparkLatro Config",scale="0.5",colour=G.C.WHITE,juice=true,align="cm"}},
                }},
                -- im gonna make label scaling gimme a min :P
                -- so i did it i hope it works
                -- Remove the color once you're done
                {n=G.UIT.R,config={align="cm"},nodes={
                create_toggle({
                    label="Keybinds",
                    ref_table=SparkLatro.ModID.config,
                    ref_value='keybinds',
                    callback=SPL.save_config(),
                    info={"S : funny sound","CTRL+Shift+R: Restart game"},
                    info_scale=0.35
                }),
                }},
                -- {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="cm"}}, -- break in line to make it seem cool i guess
                -- The goofies start Here
                {n=G.UIT.C,config={minw=0.5,r=0,minh=0,align="cm",colour=G.C.RED},nodes={
                    {n=G.UIT.T, config = {text="Game Stuff",scale=0.4,colour=G.C.WHITE,juice=true,align="cm",vert=true}},
                }},
                -- {n=G.UIT.C,config={minw=0,r=0,minh=0.25,align="cl"},nodes={
                --     {n=G.UIT.T, config = {text="For if you actually want to modify this stuff. Why though?",scale=0.4,colour=G.C.WHITE,juice=true,align="tm",vert=true}},
                -- }},
                -- {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="tm"}}, -- break in line because yes
                {n=G.UIT.R,config={minw=10,r=0,minh=0.75,align="cr"},nodes = {
                -- {n=G.UIT.C,config={minw=10}
                create_toggle({
                    label="Decks",
                    ref_table=SparkLatro.ModID.config,
                    ref_value="decks",
                    callback=SPL.save_config(),
                    info={"Enable or disable SparkLatro's decks"},
                    info_scale=0.35,
                }),
                create_toggle({
                    label="Consumables",
                    ref_table=SparkLatro.ModID.config,
                    ref_value="consumables",
                    info={"Enable or disable SparkLatro's Consumables (Planets, Spectrals, etc)"},
                    info_scale=0.35
                }),
                create_toggle({
                    label="Jokers",
                    ref_table=SparkLatro.ModID.config,
                    ref_value="jokers",
                    info={"Enable or disable SparkLatro's Jokers"},
                    info_scale=0.4
                }),
                create_toggle({
                    label="Show Tooltips",
                    ref_table=SparkLatro.ModID.config,
                    ref_value="show_tooltips",
                    info={"Enable or Disable SparkLatro's tooltips"},
                    info_scale = 0.4,
                }),
                }}},
            }
        }}
    end
end
print(returnAMenu("Page 1"))
return returnAMenu("Page 1")