defmodule Aoc2021Test.D1Nx do
  use ExUnit.Case
  alias Aoc2021.D1Nx
  doctest D1Nx

  setup_all do
    input =
      "./test/input/d1_input.txt"
      |> File.read!()
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    {:ok, input: input}
  end

  test "part 1", state do
    assert 1581 == D1Nx.part_1(state[:input])

    #  |> IO.inspect(label: :part_1)
  end

  test "part 2", state do
    assert 1618 == D1Nx.part_2(state[:input])

    #  |> IO.inspect(label: :part_2)
  end
end
