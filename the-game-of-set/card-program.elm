import Card
import Card.Color exposing (..)
import Card.Shape exposing (..)
import Html exposing (..)
import Html.App as Html

main =
  Html.beginnerProgram
    { model = { shape = Diamond, number = 3, color = Red, selected = False }
    , view = Card.view
    , update = Card.update
    }