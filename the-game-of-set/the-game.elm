import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (repeat)
import Card
import Card.Color exposing (..)
import Card.Shape exposing (..)

main =
  Html.beginnerProgram
    { model = init
    , view = view
    , update = update
    }

type alias Model =
  { cards : List Card.Model
  }

-- MODEL

init : Model
init = { cards = cards }

-- UPDATE

type Msg
    = Modify Int Card.Msg

update : Msg -> Model -> Model
update message model =
    case message of
        Modify id msg ->
            { model | cards = updateElement model.cards id msg }

updateElement : List Card.Model -> Int -> Card.Msg -> List Card.Model
updateElement list indexToSendTo msg =
  let
    send : Int -> Card.Model -> Card.Model
    send index card =
      if index == indexToSendTo then
        Card.update msg card
      else
        card
  in
    List.indexedMap send list

-- VIEW

view : Model -> Html Msg
view model =
    let cards = List.indexedMap viewIndexedCounter model.cards in
      div [] cards

viewIndexedCounter : Int -> Card.Model -> Html Msg
viewIndexedCounter id model =
  Html.map (Modify id) (Card.view model)

cards : List Card.Model
cards = [ { shape = Diamond, number = 3, color = Red, selected = False }
        , { shape = Rectangle, number = 2, color = Blue, selected = False }
        , { shape = Diamond, number = 1, color = Red, selected = False }
        ]