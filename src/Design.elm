module Design exposing (creation)

import Playground


creation : List Playground.Shape
creation =
    [ Playground.rectangle Playground.red 40 200
        |> Playground.moveDown 80
    , Playground.circle Playground.green 100
        |> Playground.moveUp 100
    ]
