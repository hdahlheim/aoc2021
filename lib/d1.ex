defmodule Aoc2021.D1 do
  @doc """
  D1

  ## Examples

      iex> Aoc2021.D1.part_1([199,200,208,210,200,207,240,269,260,263])
      7

  """
  def part_1(depths) do
    depths
    |> Stream.chunk_every(2, 1, :discard)
    |> Stream.filter(fn [a, b] -> b > a end)
    |> Enum.count()
  end

  @doc """
  D1 p2

  ## Examples

      iex> Aoc2021.D1.part_2([199,200,208,210,200,207,240,269,260,263])
      5

  """
  def part_2(depths) do
    depths
    |> Stream.chunk_every(3, 1, :discard)
    |> Stream.map(&Enum.sum/1)
    |> part_1()
  end
end
