defmodule Aoc2021Test.D7 do
  use ExUnit.Case
  alias Aoc2021.D7
  doctest D7

  setup_all do
    input =
      "./test/input/d7_input.txt"
      |> File.read!()
      |> String.split(["\n", ","], trim: true)
      |> Enum.map(&String.to_integer/1)

    {:ok, input: input}
  end

  # @tag :skip
  test "part 1", state do
    input = state[:input]

    # assert _ ==
    D7.part_1(input)
    |> IO.inspect(label: :part_1)
  end

  # @tag :skip
  test "part 2", state do
    input = state[:input]

    # assert _ ==
    D7.part_2(input)
    |> IO.inspect(label: :part_2)
  end
end
