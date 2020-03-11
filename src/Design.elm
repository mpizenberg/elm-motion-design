module Design exposing (creation)

import Playground


creation : List Playground.Shape
creation =
    [ Playground.rectangle Playground.red 80 400
        |> Playground.moveDown 160
    , Playground.circle Playground.green 200
        |> Playground.moveUp 200
    ]
