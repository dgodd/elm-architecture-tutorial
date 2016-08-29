module Card exposing (Model, Msg, update, view, init)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (repeat)
import Random
import Array
import Maybe

init: Random.Seed -> (Model, Random.Seed)
init seed0 =
    let
        (number, seed1) = Random.step (Random.int 1 3) seed0
        (shapeNum, seed2) = Random.step (Random.int 0 2) seed1
        potentialShape = Array.get shapeNum (Array.fromList [ Diamond, Oval, Rectangle ])
        shape = Maybe.withDefault Diamond potentialShape
        (colorNum, seed3) = Random.step (Random.int 0 2) seed2
        potentialColor = Array.get colorNum (Array.fromList [ Red, Blue, Purple ])
        color = Maybe.withDefault Red potentialColor
    in
        ({ shape = shape, number = number, color = color, selected = False }, seed3)

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

type Msg = SelectCard | DeselectCard | UpdateNumber Int

update : Msg -> Model -> Model
update msg model =
    case msg of
      SelectCard ->
        { model | selected = True }
      DeselectCard ->
        { model | selected = False }
      UpdateNumber new ->
        { model | number = new }

-- VIEW

view : Model -> Html Msg
view card =
    div [
            onClick (if card.selected then DeselectCard else SelectCard),
            style
                    [   ("color", toString card.color)
                      , ("width", "150px")
                      , ("height", "100px")
                      , ("line-height", "100px")
                      , ("font-size", "50px")
                      , ("border", (if card.selected then "5px solid red" else "5px solid black"))
                      , ("display", "inline-block")
                    ]
        ] [ text ((repeat card.number (asciiArt card.shape))) ]
