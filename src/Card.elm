module Card exposing (init, Model, view, Color (..), Shape (..), Number (..))
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

type Color = Red | Green | Blue
type Shape = Diamond | Oval | Squiggle
type Number = One | Two | Three

init : Int -> Model
init num =
    let
        shape = case num `rem` 3 of
            0 -> Diamond
            1 -> Oval
            _ -> Squiggle
        number = case num // 3 `rem` 3 of
            0 -> One
            1 -> Two
            _ -> Three
        color = case num // 9 `rem` 3 of
            0 -> Red
            1 -> Green
            _ -> Blue
    in
        { shape = shape, number = number, color = color }

asciiArt : Shape -> String
asciiArt shape =
    case shape of
        Diamond -> "♢"
        Oval -> "◎"
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
