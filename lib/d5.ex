defmodule Aoc2021.D5 do
  @doc """
  D5 p1

  ## Examples

      iex> Aoc2021.D5.part_1([
      iex>    [{0,9},{5,9}],
      iex>    [{8,0},{0,8}],
      iex>    [{9,4},{3,4}],
      iex>    [{2,2},{2,1}],
      iex>    [{7,0},{7,4}],
      iex>    [{6,4},{2,0}],
      iex>    [{0,9},{2,9}],
      iex>    [{3,4},{1,4}],
      iex>    [{0,0},{8,8}],
      iex>    [{5,5},{8,2}],
      iex>  ]
      iex> )
      5
  """
  def part_1(coordinates) do
    coordinates
    |> Enum.filter(&is_not_diagonal/1)
    |> count_values()
  end

  @doc """
  D4 p2

  ## Examples

      iex> Aoc2021.D5.part_1([
      iex>    [{0,9},{5,9}],
      iex>    [{8,0},{0,8}],
      iex>    [{9,4},{3,4}],
      iex>    [{2,2},{2,1}],
      iex>    [{7,0},{7,4}],
      iex>    [{6,4},{2,0}],
      iex>    [{0,9},{2,9}],
      iex>    [{3,4},{1,4}],
      iex>    [{0,0},{8,8}],
      iex>    [{5,5},{8,2}],
      iex>  ]
      iex> )
      5
  """
  def part_2(coordinates) do
    coordinates
    |> count_values()
  end

  defp is_not_diagonal([{x, _y1}, {x, _y2}]), do: true
  defp is_not_diagonal([{_x1, y}, {_x2, y}]), do: true
  defp is_not_diagonal(_), do: false

  defp count_values(coordinates) do
    Enum.reduce(coordinates, %{}, fn [{x1, y1}, {x2, y2}], map ->
      angle = :math.atan2(y2 - y1, x2 - x1)

      new_map =
        for x <- x1..x2,
            y <- y1..y2,
            angle == :math.atan2(y - y1, x - x1) or (y == y1 and x == x1),
            into: %{} do
          {{x, y}, 1}
        end

      Map.merge(map, new_map, fn _k, v1, v2 ->
        v1 + v2
      end)
    end)
    |> Enum.count(&(elem(&1, 1) > 1))
  end
end
