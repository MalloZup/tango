defmodule Tango.Mixfile do
  use Mix.Project

  def project do
    [
      app: :tango,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      escript: [main_module: Tango.CLI],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :yamerl]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
       {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
       {:yamerl, "~> 0.4.0"}
    ]
  end
end
