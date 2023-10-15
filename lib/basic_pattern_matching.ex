defmodule BasicPatternMatching do

  def get_football_clubs() do
    [:Liverpool, :Chelsea, :ManchesterUnited, :ManchesterCity, :Arsenal]
  end

  def club_details(:Liverpool) do
    {2, 16, :c2}
  end

  def club_details(:Chelsea) do
    {14, 5, :c0}
  end

  def club_details(:ManchesterUnited) do
    {9, 9, :c1}
  end

  def club_details(:ManchesterCity) do
    {1, 18, :c1}
  end

  def club_details(:Arsenal) do
    {5, 14, :c1}
  end

  def club_details(_other) do
    raise "unknown club"
  end

  def club_details_advanced(club) do
    case club do
      :Liverpool -> {2, 16, :c2}
      :Chelsea -> {14, 5, :c0}
      :ManchesterUnited -> {9, 9, :c1}
      :ManchesterCity -> {1, 18, :c1}
      :Arsenal -> {5, 14, :c1}
      _ -> raise "unknown club"
    end
  end

end
