import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (repeat)
import Card
import Random
import List exposing (repeat)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model =
  { cards : List Card.Model
  }

-- MODEL

init : (Model, Cmd Msg)
init =
    (Model [], Random.generate NewGame (Random.int 0 100000000))

-- UPDATE

type Msg = Modify Int Card.Msg | NewGame Int


update : Msg -> Model -> (Model, Cmd Msg)
update message model =
    case message of
        Modify id msg ->
            ({ model | cards = updateElement model.cards id msg }, Cmd.none)
        NewGame seed ->
            let
              f a (b, seed) = Card.init seed
              cards = List.scanl (f) (Card.init (Random.initialSeed 0), seed) [] |> List.map (\(a,b) -> a) |> List.drop 1
            in
              ({ model | cards = cards}, Cmd.none)

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

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
