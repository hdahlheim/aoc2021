defmodule Aoc2021Test.D6 do
  use ExUnit.Case
  alias Aoc2021.D6
  doctest D6

  setup_all do
    input =
      "./test/input/d6_input.txt"
      |> File.read!()
      |> String.split(["\n", ","], trim: true)
      |> Enum.map(&String.to_integer/1)

    {:ok, input: input}
  end

  # @tag :skip
  test "part 1", state do
    input = state[:input]

    # assert _ ==
    D6.part_1(input, 80)
    |> IO.inspect(label: :part_1)
  end

  # @tag :skip
  @tag timeout: :infinity
  test "part 2", state do
    input = state[:input]

    # assert _ ==
    D6.part_1(input, 256)
    |> IO.inspect(label: :part_2)
  end
end
