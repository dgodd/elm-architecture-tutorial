module Card exposing (Model, view, Color (..), Shape (..), Number (..))
import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (repeat)

type alias Model = {
        shape: Shape,
        number: Number,
        color: Color
    }

type Color = Red | Yellow | Blue
type Shape = Diamond | Oval | Rectangle | Squiggle
type Number = One | Two | Three

asciiArt : Shape -> String
asciiArt shape =
    case shape of
        Diamond -> "♢"
        Oval -> "◎"
        Rectangle -> "▭"
        Squiggle -> "❤︎"

-- VIEW

view : Model -> Html msg
view card =
    let
    repeatCount = case card.number of
        One -> 1
        Two -> 2
        Three -> 3
    in
        div [
                style
                        [   ("color", toString card.color)
                          , ("width", "150px")
                          , ("height", "100px")
                          , ("line-height", "100px")
                          , ("font-size", "50px")
                          , ("border", "1px solid black")
                          , ("display", "inline-block")
                        ]
            ] [ text ((repeat repeatCount (asciiArt card.shape))) ]
