module Helpers exposing (..)

import List
import Random

without : Int -> List a -> List a
without i list =
  let before = List.take i list
      after = List.drop (i+1) list
  in
    before ++ after

shuffle : Random.Seed -> List a -> List a
shuffle seed list =
    let
        (n, seed') = Random.step (Random.int 0 (List.length list)) seed
        nth = List.head (List.drop n list) 
        tail = without n list
    in
        case nth of
            Just val -> val :: (shuffle seed' tail)
            Nothing -> shuffle seed' tail
