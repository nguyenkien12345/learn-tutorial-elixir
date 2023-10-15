defmodule Tutorials.MixProject do
  use Mix.Project

  def project do
    [
      app: :tutorials,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:postgrex, ">= 0.0.0"},
      {:ecto_sql, "~> 3.1"},
      {:faker, "~> 0.17.0"},
      {:ex_doc, "~> 0.30.6"},
    ]
  end
end
