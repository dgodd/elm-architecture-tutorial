module Card exposing (Model, view, Color (..), Shape (..))
import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (repeat)

type alias Model = {
        shape: Shape,
        number: Int,
        color: Color
    }

type Color = Red | Yellow | Blue
type Shape = Diamond | Oval | Rectangle | Squiggle

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
        ] [ text ((repeat card.number (asciiArt card.shape))) ]
