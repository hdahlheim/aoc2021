defmodule Aoc2021Test.D3Nx do
  use ExUnit.Case
  alias Aoc2021.D3Nx
  doctest D3Nx

  setup_all do
    input =
      "./test/input/d3_input.txt"
      |> File.read!()
      |> String.split("\n", trim: true)
      |> Enum.map(fn l ->
        l
        |> String.graphemes()
        |> Enum.map(&String.to_integer/1)
      end)

    {:ok, input: input}
  end

  test "part 1", state do
    assert 852_500 ==
             D3Nx.part_1(state[:input])
             |> IO.inspect(label: :part_1)
  end

  @tag :skip
  test "part 2", state do
    assert 1_007_985 ==
             D3Nx.part_2(state[:input])
             |> IO.inspect(label: :part_2)
  end
end
