module Game

open System.Collections.Generic 
open Microsoft.Xna.Framework
open Microsoft.Xna.Framework.Graphics
open Microsoft.Xna.Framework.Input

type Invader() as this =
    inherit Game()

    do this.Window.Title <- "Invader"

    let graphics = new GraphicsDeviceManager(this)
    do graphics.PreferredBackBufferWidth <- 800
    do graphics.PreferredBackBufferHeight <- 600

    override this.LoadContent() =
        ()

    override this.Update(gameTime) =
        ()

    override this.Draw(gameTime) =
        do this.GraphicsDevice.Clear Color.Black
        ()