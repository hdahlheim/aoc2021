defmodule Aoc2021Test.D5 do
  use ExUnit.Case
  alias Aoc2021.D5
  doctest D5

  setup_all do
    input =
      "./test/input/d5_input.txt"
      |> File.read!()
      |> String.split("\n", trim: true)
      |> Enum.map(fn l ->
        String.split(l, " -> ", trim: true)
        |> Enum.map(fn c ->
          [x, y] = String.split(c, ",")
          {String.to_integer(x), String.to_integer(y)}
        end)
      end)

    {:ok, input: input}
  end

  # @tag :skip
  test "part 1", state do
    input = state[:input]

    assert 5084 ==
             D5.part_1(input)
             |> IO.inspect(label: :part_1)
  end

  # @tag :skip
  test "part 2", state do
    input = state[:input]

    assert 17882 ==
             D5.part_2(input)
             |> IO.inspect(label: :part_2)
  end
end
