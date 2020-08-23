{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "wire-react"
, dependencies =
  [ "wire"
  , "free"
  , "freet"
  , "react-basic-hooks"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
