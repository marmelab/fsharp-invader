open Game

[<EntryPoint>]
let main argv = 
    use g = new Invader()
    g.Run()
    0