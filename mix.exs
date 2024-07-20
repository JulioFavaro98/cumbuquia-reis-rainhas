defmodule DesafioCli.MixProject do
  use Mix.Project

  def project do
    [
      app: :desafio_cli,
      version: "0.1.0",
      elixir: "~> 1.17",
      escript: [main_module: DesafioCli],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end
end
