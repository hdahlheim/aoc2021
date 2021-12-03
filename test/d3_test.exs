defmodule Aoc2021Test.D3 do
  use ExUnit.Case
  doctest Aoc2021.D3

  # @tag :skip
  test "part 1" do
    input =
      File.read!("./test/input/d3_input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(fn l ->
        l
        |> String.graphemes()
        |> Enum.map(&String.to_integer/1)
      end)

    assert 852_500 ==
             Aoc2021.D3.part_1(input)
             |> IO.inspect(label: :part_1)
  end

  test "part 2" do
    input =
      File.read!("./test/input/d3_input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(fn l ->
        l
        |> String.graphemes()
        |> Enum.map(&String.to_integer/1)
      end)

    assert 1_007_985 ==
             Aoc2021.D3.part_2(input)
             |> IO.inspect(label: :part_2)
  end
end
