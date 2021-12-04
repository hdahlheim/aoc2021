defmodule Aoc2021Test.D2Nx do
  use ExUnit.Case
  alias Aoc2021.D2Nx
  doctest D2Nx

  setup_all do
    input =
      File.read!("./test/input/d2_input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, " "))

    {:ok, input: input}
  end

  # @tag :skip
  test "part 1", state do
    assert 1_488_669 ==
             D2Nx.part_1(state[:input])

    #  |> IO.inspect(label: :part_1)
  end

  # @tag :skip
  test "part 2", state do
    assert 1_176_514_794 ==
             D2Nx.part_2(state[:input])

    #  |> IO.inspect(label: :part_2)
  end
end
