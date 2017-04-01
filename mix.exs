defmodule DodgeCity.Mixfile do
  use Mix.Project

  def project do
    [app: :dodge_city,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :maru, :coyote]]
  end

  defp deps do
    [
      {:maru, "~> 0.10"},
      {:coyote, path: "../coyote"}
    ]
  end
end
