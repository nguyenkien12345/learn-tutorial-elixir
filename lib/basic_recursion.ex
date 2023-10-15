defmodule Recursion do

  def get_club_list() do
    ["Liverpool", "Chelsea", "Tottenham", "Arsenal", "Mu", "Mc", "Liverpool", "Liverpool", "Chelsea"]
  end

  # VD1
  def loop([]), do: nil
  def loop([head | tail]) do
    IO.puts(head)
    loop(tail)
  end

  # VD2
  def club_count([]), do: 0
  def club_count([_head | tail]) do
    1 + club_count(tail)
  end

  # VD3
  def format_club_list([]), do: []
  def format_club_list([head | tail]) do
    # Toán tử | được sử dụng để hợp nhất các tập hợp lại với nhau
    [ head |> String.downcase() |> String.replace(" ", "_") | format_club_list(tail) ]
  end

  # VD4 Đếm số lần xuất hiện của 1 phần tử trong list. Nhận vào list và đối tượng muốn đếm số lần xuất hiện trong list
  def occurrence_count([], _value), do: 0
  def occurrence_count([_head | _tail], "Mu"), do: 500
  # Nếu mà head (ở đây ta đang đặt là value) bằng với value truyền vào thì đếm +1
  def occurrence_count([value | tail], value), do: 1 + occurrence_count(tail, value)
  # Nếu mà head (ở đây ta đang đặt là _head) không bằng với value truyền vào thì không đếm +1
  def occurrence_count([_head | tail], value), do: occurrence_count(tail, value)
end

# Recursion.loop(Recursion.get_club_list())
# Recursion.club_count(Recursion.get_club_list()) |> IO.puts()
# Recursion.format_club_list(Recursion.get_club_list()) |> IO.inspect()
Recursion.occurrence_count(Recursion.get_club_list(), "Arsenal") |> IO.puts()
