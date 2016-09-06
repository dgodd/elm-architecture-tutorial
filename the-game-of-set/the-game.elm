import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (repeat)
import Card exposing (Color (..), Shape (..))
import Selectable exposing (..)

main =
  Html.beginnerProgram
    { model = init
    , view = view
    , update = update
    }

type alias Model =
  { cards : List (SelectableCard)
  }

type alias SelectableCard = Selectable Card.Model

-- MODEL

init : Model
init = { cards = List.map unselected cards }


cards : List Card.Model
cards = [ { shape = Diamond, number = 3, color = Red }
        , { shape = Rectangle, number = 2, color = Blue }
        , { shape = Diamond, number = 1, color = Red }
        , { shape = Squiggle, number = 2, color = Blue }
        ]

-- UPDATE

type Msg
    = ToggleSelect Int

update : Msg -> Model -> Model
update message model =
    case message of
        ToggleSelect id ->
            { model | cards = applyAtIndex id toggle model.cards }

applyAtIndex : Int -> (a -> a) -> List a -> List a
applyAtIndex indexToSendTo action elements =
    let
        applyIfMatching index element =
            if index == indexToSendTo then action element
            else element
    in
        List.indexedMap applyIfMatching elements

-- VIEW

view : Model -> Html Msg
view model =
    let cards = List.indexedMap viewIndexedCard model.cards in
      div [] cards

viewIndexedCard : Int -> SelectableCard -> Html Msg
viewIndexedCard id selectable =
  span [
        onClick (ToggleSelect id),
        style [("border", selectableBorder selectable)]
      ] [
        Card.view selectable.item
      ]

selectableBorder : Selectable a -> String
selectableBorder selectable =
    if selectable.selected then "1px solid red"
    else "1px solid black"

