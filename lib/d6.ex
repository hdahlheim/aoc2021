defmodule Aoc2021.D6 do
  @doc """
  D6 p1

  ## Examples

      iex> Aoc2021.D6.part_1([3,4,3,1,2], 2)
      6

      iex> Aoc2021.D6.part_1([3,4,3,1,2], 18)
      26

      iex> Aoc2021.D6.part_1([3,4,3,1,2], 80)
      5934
  """
  def part_1(fish, days) do
    calc_fish(fish, days)
  end

  @doc """
  D6 p2

  ## Examples
      iex> Aoc2021.D6.part_2([3,4,3,1,2], 256)
      26984457539
  """
  def part_2(fish, days) do
    calc_fish(fish, days)
  end

  defp calc_fish(fish, days) do
    result_map = for x <- 0..8, into: %{}, do: {x, 0}

    map =
      Enum.reduce(fish, result_map, fn lives, map ->
        %{map | lives => map[lives] + 1}
      end)

    Enum.reduce(1..days, {map, 0}, fn _day, {m, o} ->
      # got the idea from reddit after waiting 30s
      {%{m | rem(o + 7, 9) => m[rem(o + 7, 9)] + m[rem(o, 9)]}, o + 1}
    end)
    |> elem(0)
    |> Map.values()
    |> Enum.sum()
  end
end
