defmodule Aoc2021Test.D4 do
  use ExUnit.Case
  alias Aoc2021.D4
  doctest D4

  setup_all do
    input =
      "./test/input/d4_input.txt"
      |> File.read!()
      |> String.split("\n\n", trim: true)
      |> then(fn [h | t] ->
        cards =
          Enum.map(t, &String.split(&1, "\n", trim: true))
          |> Enum.map(fn l ->
            Enum.map(l, fn row ->
              String.split(row, " ", trim: true)
              |> Enum.map(&String.to_integer/1)
            end)
          end)

        calls =
          String.split(h, ",", trim: true)
          |> Enum.map(&String.to_integer/1)

        {cards, calls}
      end)

    {:ok, input: input}
  end

  # @tag :skip
  test "part 1", state do
    {boards, calls} = state[:input]

    assert 8136 ==
             D4.part_1(boards, calls)
             |> IO.inspect(label: :part_1)
  end

  # @tag :skip
  test "part 2", state do
    {boards, calls} = state[:input]

    assert 12738 ==
             D4.part_2(boards, calls)
             |> IO.inspect(label: :part_2)
  end
end
