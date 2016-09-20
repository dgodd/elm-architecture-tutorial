module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import Helpers


example : Test
example =
    describe "A Test Suite"
        [ test "Addition" <|
            \() ->
                Expect.equal (3 + 7) 10
        , test "String.left" <|
            \() ->
                Expect.equal "a" (String.left 1 "abcdefg")
        , test "This test should fail" <|
            \() ->
                Expect.fail "failed as expected!"
        ]

all : Test
all =
    describe "Shuffle Suite"
        [ test "simple" <|
            \() ->
                Expect.equal (Helpers.shuffle []) []
        ]

