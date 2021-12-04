defmodule Aoc2021.D2Nx do
  @doc """
  D2

  ## Examples

      iex> Aoc2021.D2Nx.part_1([["forward", "5"],["down", "5"],["forward", "8"],["up", "3"],["down", "8"],["forward", "2"]])
      150

  """
  def part_1(moves) do
    Enum.map(moves, fn
      ["forward", num] -> {String.to_integer(num), 0}
      ["down", num] -> {0, String.to_integer(num)}
      ["up", num] -> {0, -String.to_integer(num)}
    end)
    |> Enum.unzip()
    |> then(fn {xs, ys} -> {Nx.sum(Nx.tensor(xs)), Nx.sum(Nx.tensor(ys))} end)
    |> then(fn {x, y} -> Nx.multiply(x, y) end)
    |> Nx.to_scalar()

    # Enum.map(moves, fn
    #   ["forward", num] -> [String.to_integer(num), 0]
    #   ["down", num] -> [0, String.to_integer(num)]
    #   ["up", num] -> [0, -String.to_integer(num)]
    # end)
    # |> Nx.tensor(names: [:x, :y])
    # |> Nx.sum(axes: [:x])
    # |> Nx.product()
    # |> Nx.to_scalar()
  end

  @doc """
  D2 p2

  ## Examples

      iex> Aoc2021.D2Nx.part_2([["forward", "5"],["down", "5"],["forward", "8"],["up", "3"],["down", "8"],["forward", "2"]])
      900

  """
  def part_2(moves) do
    Enum.map(moves, fn
      ["forward", num] -> {String.to_integer(num), 0}
      ["down", num] -> {0, String.to_integer(num)}
      ["up", num] -> {0, -String.to_integer(num)}
    end)
    |> Enum.unzip()
    |> then(fn {f_moves, aims} ->
      aims = Nx.tensor(aims)
      f_moves = Nx.tensor(f_moves)

      n = Nx.size(aims)
      aim_sum = Nx.window_sum(aims, {n}, padding: [{n - 1, 0}])

      d = Nx.dot(aim_sum, f_moves)
      x_moves = Nx.sum(f_moves)

      Nx.multiply(d, x_moves)
      |> Nx.to_scalar()
    end)
  end
end
