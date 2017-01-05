module App exposing (Model, Msg, init, update, view, subscriptions)

import Html exposing (..)
import Html.Attributes as Attr
import Html.Events exposing (..)



-- MODEL


type alias Model =
  { currentRoute : Route
  }



init : (Model, Cmd Msg)
init =



-- UPDATE


type Msg =

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  div [] []