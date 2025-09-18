
nodes = {}
settings = { n = G.UIT.C, config = { align = "tm", padding = 0.05 }, nodes = {} }
-- SparkLatro Config Label
settings.nodes[#settings.nodes + 1] = {n=G.UIT.R,config={colour=G.C.RED,minw=10,r=0,minh=0.75,align="cm"},nodes={
    {n=G.UIT.T, config = {text="SparkLatro Config",scale="0.5",colour=G.C.WHITE,juice=true,align="cm"}},
}}
-- im gonna make label scaling gimme a min :P
-- so i did it i hope it works
-- Remove the color once you're done
settings.nodes[#settings.nodes + 1] ={n=G.UIT.R,config={align="cm"},nodes={
    create_toggle({
        label="Keybinds",
        ref_table=SparkLatro.ModID.config,
        ref_value='keybinds',
        callback=SPL.save_config(),
        info={"S: funny sound","CTRL+Shift+R: Restart game"},
        info_scale=0.35
    }),
}}
settings.nodes[#settings.nodes + 1] = {n=G.UIT.R,config={minw=10,r=0,minh=0.25,align="cm"},nodes={
    {n=G.UIT.T, config = {text="For game config, check the Game Stuff tab.",scale=0.3,colour=G.C.WHITE,juice=true,align="cm"}},
}}
config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { settings } }
nodes[#nodes + 1] = config
return {
    n = G.UIT.ROOT,
    config = {
        emboss = 0.05,
        minh = 6,
        r = 0.1,
        minw = 10,
        align = "cm",
        padding = 0.2,
        colour = G.C.BLACK,
    },
    nodes = nodes,
}