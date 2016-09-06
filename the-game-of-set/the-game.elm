import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (repeat)
import Card exposing (Color (..), Shape (..))

main =
  Html.beginnerProgram
    { model = init
    , view = view
    , update = update
    }

type alias Model =
  { cards : List (SelectableCard)
  }

type alias Selectable a =
    { item: a
    , selected: Bool
    }

type alias SelectableCard = Selectable Card.Model

-- MODEL

init : Model
init = { cards = List.map withoutSelection cards }

withoutSelection : item -> Selectable item
withoutSelection item =
    { item = item
    , selected = False
    }

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
            { model | cards = updateElement model.cards id }

updateElement : List SelectableCard -> Int -> List SelectableCard
updateElement list indexToSendTo =
  let
    send : Int -> Selectable Card.Model -> Selectable Card.Model
    send index selectable =
      if index == indexToSendTo then
        { selectable | selected = not selectable.selected}
      else
        selectable
  in
    List.indexedMap send list

-- VIEW

view : Model -> Html Msg
view model =
    let cards = List.indexedMap viewIndexedCounter model.cards in
      div [] cards

viewIndexedCounter : Int -> Selectable Card.Model -> Html Msg
viewIndexedCounter id selectable =
  span [
        onClick (ToggleSelect id),
        style [("border", selectableBorder selectable)]
      ] [
        Card.view selectable.item
      ]

selectableBorder : Selectable a -> String
selectableBorder selectable = if selectable.selected then "1px solid red" else "1px solid black"

