# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :maru, DodgeCity.API,
  http: [port: 8880]

config :coyote,
  use_web_adaptor: false
