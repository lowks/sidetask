defmodule SideTask.Mixfile do
  use Mix.Project

  def project do
    [app: :sidetask,
     version: "0.1.0",
     elixir: "~> 1.0",
     source_url: "https://github.com/MSch/sidetask",
     description: description,
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger, :sidejob]]
  end

  defp description do
    """
    SideTask is an alternative to Elixir's Task.Supervisor that uses Basho's sidejob library for
    better parallelism and to support capacity limiting of Tasks.

    SideTask provides an API similar to Task.Supervisor, with the addition that all calls that start
    a new task require a sidejob resource as argument and can return `{:error, :overload}`.

    Convenience functions for adding and deleting sidejob resources are provided.
    """
  end

  defp package do
    [contributors: ["Martin Schurrer"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/MSch/sidetask"},
     files: ["lib", "mix.exs", "README.md"]]
  end

  defp deps do
    [
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.6", only: :dev},
      {:sidejob, "~> 2.0"},
    ]
  end
end
