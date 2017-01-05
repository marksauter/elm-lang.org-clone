import Html exposing (..)
import Html.Attributes exposing (..)


(=>) : a -> b -> ( a, b )
(=>) = (,)


main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model = String



init : (Model, Cmd Msg)
init =
  "Hello World" => Cmd.none



-- UPDATE


type Msg 
  = Message

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Message ->
      model => Cmd.none



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  div [ id "home-root" ]
    [ myHeader
    , mySplash
    , myMain
    , myFooter
    ]

myHeader : Html msg
myHeader =
  header [ id "site-header", class "site-header" ]
    [ div [ id "site-header__logo" ]
      [ a [ class "tab", href root] [ logo ] ]
    , nav [ class "site-header__nav" ]
      [ ul [] navLinks ]
    ]

root : String
root = "/build"

logo : Html msg
logo = 
  img 
    [ src "./assets/logo.svg"
    , style [ "width" => "24px" ] 
    ] []

navLinks : List (Html msg)
navLinks =
  List.map navLink [ "examples", "docs", "community", "blog" ]

navLink : String -> Html msg
navLink link =
  li [ id link ]
    [ a [ href "#" ] 
      [ text link ] 
    ]


mySplash : Html msg
mySplash =
  div [ class "splash", id "main-splash" ] 
    [ div [ class "title" ] [ text "elm" ]
    , div [ class "subtitle" ] [ text "A delightful language for reliable webapps." ]
    , div [ class "subtext" ] [ text "Generate with great performance and no runtime exceptions." ]
    , div [ class "links" ]
      [ a [ href "#" ]
        [ text "Try Online" ]
      , a [ href "http://guide.elm-lang.org/install.html" ]
        [ text "Install" ]
      ]
    ]


myMain : Html msg
myMain =
  main_ [ class "main-content" ]
    [ text "Content" ]



myFooter : Html msg
myFooter =
  footer [ class "site-footer" ]
    [ text "All code for this site is open source and written in Elm. "
    , a 
      [ class "grey-link"
      , href "https://github.com/marksauter/elm-lang.org-clone/" ] 
      [ text "Check it out" ]
    , text "! - © 2016-2017 Mark Sauter"
    ]

