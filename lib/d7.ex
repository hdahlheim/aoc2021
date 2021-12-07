defmodule Aoc2021.D7 do
  @doc """
  D7 p1

  ## Examples

      iex> Aoc2021.D7.part_1([16,1,2,0,4,2,7,1,2,14])
      37
  """
  def part_1(crabs) do
    init_map =
      Enum.map(crabs, fn v -> {v, 0} end)
      |> Enum.into(%{})

    Enum.reduce(crabs, init_map, fn v, acc ->
      for {k, vo} <- acc, into: %{} do
        moves = if k >= v, do: k - v, else: v - k
        {k, vo + moves}
      end
    end)
    |> Map.values()
    |> Enum.min()
  end

  @doc """
  D7 p2

  ## Examples
      iex> Aoc2021.D7.part_2([16,1,2,0,4,2,7,1,2,14])
      168
  """
  def part_2(crabs) do
    # we only need to check half of the possible positions
    half_len = div(length(crabs), 2)

    init_map =
      Enum.map(1..half_len, fn v -> {v, 0} end)
      |> Enum.into(%{})

    Enum.reduce(crabs, init_map, fn v, acc ->
      for {k, vo} <- acc, into: %{} do
        moves = if k >= v, do: k - v, else: v - k

        costs =
          if moves > 0,
            do: 1..moves,
            else: [0]

        {k, vo + Enum.sum(costs)}
      end
    end)
    |> Map.values()
    |> Enum.min()
  end
end
