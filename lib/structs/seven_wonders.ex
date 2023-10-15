defmodule Tutorials.Structs.SevenWonders do
  alias Tutorials.Structs.SevenWonders

  defstruct name: "", country: ""

  @type t :: %SevenWonders{
    name: String.t(),
    country: String.t(),
  }

  @spec all() :: [t()]
  def all() do
    [
      %SevenWonders{name: "Taj Mahal", country: "India"},
      %SevenWonders{name: "Chichén Itzá", country: "Mexico"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Cristo Redentor", country: "Brasil"},
      %SevenWonders{name: "Colosseo", country: "Italy"},
      %SevenWonders{name: "The Great Wall of China", country: "China"},
    ]
  end

  @spec print_names([t()]) :: :ok
  def print_names(list) do
    list
    |> Enum.each(fn %{name: name} -> String.upcase(name) |> IO.puts() end)
  end

  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(list, country) do
    list
    |> Enum.filter(fn %{country: country_name} -> country_name == country end)
  end

  @spec in_countries_starting_with_i([t()]) :: [t()]
  def in_countries_starting_with_i(list) do
    list
    |> Enum.filter(fn %{country: country_name} -> String.starts_with?(country_name |> String.first |> String.upcase,"I") end)
  end

  @spec in_countries_ending_with_a([t()]) :: [t()]
  def in_countries_ending_with_a(list) do
    list
    |> Enum.filter(fn %{country: country_name} -> String.ends_with?(country_name |> String.last |> String.upcase,"A") end)
  end

  @spec sort_by_country_length([t()], String) :: [t()]
  def sort_by_country_length(list, condition) do
    cond do
      condition == "asc" -> list |> Enum.sort(fn x,y -> String.length(x.country) < String.length(y.country) end)
      condition == "desc" -> list |> Enum.sort(fn x,y -> String.length(x.country) > String.length(y.country) end)
      true -> list
    end
  end

  @spec country_name_list([t()]) :: [t()]
  def country_name_list(list) do
    # Expect Output: [["Taj Mahal", "India"], ["Chichén Itzá", "Mexico"], ["Petra", "Jordan"], ["Machu Picchu", "Peru"], ...]
    # VD: Enum.reduce([1, 2, 3, 4], fn x, acc -> x * acc end)
    list
    |> Enum.reduce([], fn x, acc -> [[x.name, x.country] | acc] end)
  end

  @spec country_name_keyword_list([t()]) :: [t()]
  def country_name_keyword_list(list) do
    # Expect Output: [India: "Taj Mahal", Mexico: "Chichén Itzá", Jordan: "Petra", Peru: "Machu Picchu", ...]
    list
    |> Enum.reduce([], fn x, acc -> [{String.to_atom(x.country), x.name} | acc] end)
  end

  @spec all_names_and_keys([t()]) :: %{keys: [String.t()], values: [String.t()]}
  def all_names_and_keys(list) do
    # Cách 1
    # keys = Enum.map(list, fn x -> x.name end)
    # values = Enum.map(list, fn x -> x.country end)

    # Cách 2
    keys = for %{name: name} <- list do name end
    values = for %{country: country} <- list do country end

    result = %{
      keys: keys,
      values: values
    }
    result
  end
end

# Tutorials.Structs.SevenWonders.print_names(Tutorials.Structs.SevenWonders.all())
# Tutorials.Structs.SevenWonders.filter_by_country(Tutorials.Structs.SevenWonders.all(), "Brasil") |> IO.inspect()
# Tutorials.Structs.SevenWonders.in_countries_starting_with_i(Tutorials.Structs.SevenWonders.all()) |> IO.inspect()
# Tutorials.Structs.SevenWonders.in_countries_ending_with_a(Tutorials.Structs.SevenWonders.all()) |> IO.inspect()
# Tutorials.Structs.SevenWonders.sort_by_country_length(Tutorials.Structs.SevenWonders.all(), "asc") |> IO.inspect()
# Tutorials.Structs.SevenWonders.sort_by_country_length(Tutorials.Structs.SevenWonders.all(), "desc") |> IO.inspect()
# Tutorials.Structs.SevenWonders.country_name_list(Tutorials.Structs.SevenWonders.all()) |> IO.inspect()
# Tutorials.Structs.SevenWonders.country_name_keyword_list(Tutorials.Structs.SevenWonders.all()) |> IO.inspect()
# Tutorials.Structs.SevenWonders.all_names_and_keys(Tutorials.Structs.SevenWonders.all()) |> IO.inspect()
