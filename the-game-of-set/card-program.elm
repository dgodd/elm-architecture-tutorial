import Card
import Html exposing (..)
import Html.App as Html

main =
  Html.beginnerProgram
    { model = Card.init
    , view = Card.view
    , update = Card.update
    }