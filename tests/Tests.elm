module Tests exposing (..)

import Test exposing (..)
import Expect
import String


all : Test
all =
    describe "TheNews Test Suite"
        [ describe "DateFormat"
            [ test "formats a unix timestamp as a string" <|
                \() ->
                    Expect.equal 0 0
            , test "pads certain times with zeroes" <|
                \() ->
                    Expect.equal 0 0
            ]
        ]