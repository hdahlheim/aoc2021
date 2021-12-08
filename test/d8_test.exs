defmodule Aoc2021Test.D8 do
  use ExUnit.Case
  alias Aoc2021.D8
  doctest D8

  setup_all do
    input =
      "./test/input/d8_input.txt"
      |> File.read!()

    #   |> String.split(["\n", ","], trim: true)
    #   |> Enum.map(&String.to_integer/1)

    {:ok, input: input}
  end

  # @tag :skip
  test "part 1", state do
    input = state[:input]

    assert 476 ==
             D8.part_1(input)
             |> IO.inspect(label: :part_1)
  end

  # @tag :skip
  test "part 2", state do
    input = state[:input]

    assert 1_011_823 ==
             D8.part_2(input)
             |> IO.inspect(label: :part_2)
  end
end
