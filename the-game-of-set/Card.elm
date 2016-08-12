module Card exposing (Model, Msg, update, view, init)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (repeat)

init: Model
init =
    { shape = Diamond, number = 3, color = Red, selected = False }

type alias Model = {
        shape: Shape,
        number: Int,
        color: Color,
        selected: Bool
    }

type Color = Red | Blue | Purple

type Shape = Diamond | Oval | Rectangle

asciiArt : Shape -> String
asciiArt shape =
    case shape of
        Diamond -> "♢"
        Oval -> "◎"
        Rectangle -> "▭"


-- UPDATE

type Msg = SelectCard

update : Msg -> Model -> Model
update msg model =
    model

-- VIEW

view : Model -> Html Msg
view card =
    div [
            onClick SelectCard,
            style
                    [   ("color", toString card.color)
                      , ("width", "150px")
                      , ("height", "100px")
                      , ("line-height", "100px")
                      , ("font-size", "50px")
                      , ("border", "1px solid black")
                      , ("display", "inline-block")
                    ]
        ] [ text (repeat card.number (asciiArt card.shape) ) ]
