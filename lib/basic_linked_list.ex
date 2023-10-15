defmodule BasicLinkedList do

  def get_football_clubs() do
    ["Liverpool", "Chelsea", "Manchester United", "Manchester City", "Arsenal", "Tottenham", "Everton"]
  end

  def get_first_element(list) do
    hd(list)
  end

  def remove_first_element(list) do
    tl(list)
  end

  def add_slow(list, value) do
    list ++ [value]
  end

  def add_fast(list, value) do
    # Method 1
    # list_reversed = Enum.reverse(list)
    # new_list = [value | list_reversed]
    # Enum.reverse(new_list)

    # Method 2.
    # .(): Call the unnamed function immediately after it is defined
    list
    |> Enum.reverse()
    |> (fn list_reversed ->
      [value | list_reversed]
    end).()
    |> Enum.reverse()
  end

  def remove_element(list, index) do
    List.delete_at(list, index)
  end

  def count_element(list) do
    length(list)
  end

  # Check if an element exists in the list
  def check_for_element(list, item) do
    item in list
  end
end
