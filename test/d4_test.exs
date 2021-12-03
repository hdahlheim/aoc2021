defmodule Aoc2021Test.D4 do
  use ExUnit.Case
  alias Aoc2021.D4
  doctest D4

  setup_all do
    input =
      "./test/input/d4_input.txt"
      |> File.read!()
      |> String.split("\n", trim: true)

    # |> Enum.map(fn _l ->
    #   nil
    #   # l
    #   # |> String.graphemes()
    #   # |> Enum.map(&String.to_integer/1)
    # end)

    {:ok, input: input}
  end

  @tag :skip
  test "part 1", state do
    D4.part_1(state[:input])
    |> IO.inspect(label: :part_1)
  end

  @tag :skip
  test "part 2", state do
    D4.part_2(state[:input])
    |> IO.inspect(label: :part_2)
  end
end
