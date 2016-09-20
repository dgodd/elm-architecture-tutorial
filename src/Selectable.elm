module Selectable exposing (..)

type alias Selectable a =
    { item: a
    , selected: Bool
    }

unselected : item -> Selectable item
unselected item =
    { item = item
    , selected = False
    }

toggle : Selectable item -> Selectable item
toggle selectable = { selectable | selected = not selectable.selected}