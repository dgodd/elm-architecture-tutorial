module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import Random
import Helpers


all : Test
all =
    describe "Without Suite"
        [ test "shuffle empty" <|
            \() ->
                Expect.equal (Helpers.shuffle (Random.initialSeed 123) []) []
        , test "shuffle three" <|
            \() ->
                Expect.equal (Helpers.shuffle (Random.initialSeed 123) [1,2,3]) [2,1,3]
        , test "shuffle three" <|
            \() ->
                Expect.equal (Helpers.shuffle (Random.initialSeed 123) [1..10]) [10,9,4,7,6,3,8,5,2,1]
        ]
