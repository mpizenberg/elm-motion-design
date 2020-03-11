module Main exposing (main)

import Browser
import Design
import Element exposing (Element, px)
import Element.Border
import Element.Input
import Html exposing (Html)
import Playground exposing (Screen)
import Ports


main : Program () Screen Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type Msg
    = Export


init : () -> ( Screen, Cmd Msg )
init () =
    ( Playground.toScreen 600 600, Cmd.none )


view : Screen -> Html Msg
view _ =
    Element.layout [] layout


layout : Element Msg
layout =
    Element.column [] [ playground, actions ]


creationId : String
creationId =
    "design-creation"


playground : Element msg
playground =
    let
        borderWidth =
            2
    in
    Element.el
        [ Element.width (px (960 + 2 * borderWidth))
        , Element.height (px (540 + 2 * borderWidth))
        , Element.Border.solid
        , Element.Border.color (Element.rgb 0 0 0)
        , Element.Border.width borderWidth
        ]
        (Element.html (Playground.render creationId (Playground.toScreen 960 540) Design.creation))


actions : Element Msg
actions =
    Element.Input.button []
        { onPress = Just Export
        , label = Element.text "export"
        }


update : Msg -> Screen -> ( Screen, Cmd Msg )
update msg _ =
    case msg of
        Export ->
            ( Playground.toScreen 0 0
            , Ports.export creationId
            )


subscriptions : Screen -> Sub Msg
subscriptions _ =
    Sub.none
