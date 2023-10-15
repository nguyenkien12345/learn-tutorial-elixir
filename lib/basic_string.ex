defmodule BasicString do

  def first_letter(value) do
    "First letter: " <> "#{String.trim(value) |> String.first()}"
  end

  def last_letter(value) do
    "Last letter: " <> "#{String.trim(value) |> String.last()}"
  end

  def upper_first_letter(value) do
    first_letter(value)
    |> String.upcase()
  end

  def lower_last_letter(value) do
    last_letter(value)
    |> String.downcase()
  end

  def custom_fullnames(full_name) do
    list = String.split(full_name)
    Enum.map(list, fn name ->
      String.upcase(name)
    end)
    |> List.to_string()
  end

end
