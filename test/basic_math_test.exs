defmodule BasicMathTest do
  use ExUnit.Case
  doctest BasicMath

  test "plus 2 + 3 = 5" do
    assert BasicMath.plus(2,3) == 5
  end

  test "plus 10 + 20 = 30" do
    assert BasicMath.plus(10,20) == 30
  end

  test "plus 30 + 20 = 50" do
    assert BasicMath.plus(30,20) == 50
  end

  test "minus 10 - 10 = 0" do
    assert BasicMath.minus(10,10) == 0
  end

  test "minus 10 - 20 = -10" do
    assert BasicMath.minus(10,20) == -10
  end

  test "minus 30 - 20 = 50" do
    assert BasicMath.minus(30,20) == 10
  end

  test "multi 10 * 10 = 100" do
    assert BasicMath.multi(10,10) == 100
  end

  test "multi 10 * 20 = 200" do
    assert BasicMath.multi(10,20) == 200
  end

  test "multi 30 * 20 = 600" do
    assert BasicMath.multi(30,20) == 600
  end

  test "devide 10 / 10 = 1" do
    assert BasicMath.devide(10,10) == 1
  end

  test "devide 10 / 20 = 0.5" do
    assert BasicMath.devide(10,20) == 0.5
  end

  test "devide 30 / 20 = 1.5" do
    assert BasicMath.devide(30,20) == 1.5
  end
end
