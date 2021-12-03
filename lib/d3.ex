defmodule Aoc2021.D3 do
  @doc """
  D3

  ## Examples

      iex> Aoc2021.D3.part_1([
      iex>   [0,0,1,0,0],
      iex>   [1,1,1,1,0],
      iex>   [1,0,1,1,0],
      iex>   [1,0,1,1,1],
      iex>   [1,0,1,0,1],
      iex>   [0,1,1,1,1],
      iex>   [0,0,1,1,1],
      iex>   [1,1,1,0,0],
      iex>   [1,0,0,0,0],
      iex>   [1,1,0,0,1],
      iex>   [0,0,0,1,0],
      iex>   [0,1,0,1,0],
      iex> ])
      198

  """
  def part_1(power) do
    len = length(power)
    accLen = Enum.at(power, 0) |> length()

    acc = Enum.reduce(1..accLen, [0], fn _, acc -> [0 | acc] end)

    res =
      Enum.reduce(power, acc, fn e, a ->
        Enum.with_index(e)
        |> Enum.map(fn {v, i} -> v + Enum.at(a, i) end)
      end)

    gamma =
      Enum.map(res, fn bit_count -> if bit_count >= div(len, 2), do: 1, else: 0 end)
      |> Enum.join()
      |> String.to_integer(2)

    epsilon =
      Enum.map(res, fn bit_count -> if bit_count <= div(len, 2), do: 1, else: 0 end)
      |> Enum.join()
      |> String.to_integer(2)

    gamma * epsilon
  end

  @doc """
  D3 p2

  ## Examples

      iex> Aoc2021.D3.part_2([
      iex>   [0,0,1,0,0],
      iex>   [1,1,1,1,0],
      iex>   [1,0,1,1,0],
      iex>   [1,0,1,1,1],
      iex>   [1,0,1,0,1],
      iex>   [0,1,1,1,1],
      iex>   [0,0,1,1,1],
      iex>   [1,1,1,0,0],
      iex>   [1,0,0,0,0],
      iex>   [1,1,0,0,1],
      iex>   [0,0,0,1,0],
      iex>   [0,1,0,1,0],
      iex> ])
      230

  """
  def part_2(power) do
    # len = length(power)
    accLen = Enum.at(power, 0) |> length()

    acc = Enum.reduce(1..accLen, [0], fn _, acc -> [0 | acc] end)

    oxgen = filter_oxgen(power, 0, acc)
    co2 = filter_co2(power, 0, acc)

    co2 * oxgen
  end

  defp filter_oxgen([val], _index, _), do: val |> Enum.join() |> String.to_integer(2)

  defp filter_oxgen(power, index, line_size) do
    len = length(power)

    res =
      Enum.reduce(power, line_size, fn e, a ->
        Enum.with_index(e)
        |> Enum.map(fn {v, i} -> v + Enum.at(a, i) end)
      end)

    bit_count = Enum.at(res, index)

    Enum.filter(power, fn entry ->
      bit = if bit_count >= len / 2, do: 1, else: 0
      Enum.at(entry, index) == bit
    end)
    |> filter_oxgen(index + 1, line_size)
  end

  defp filter_co2([val], _index, _), do: val |> Enum.join() |> String.to_integer(2)

  defp filter_co2(power, index, line_size) do
    len = length(power)

    res =
      Enum.reduce(power, line_size, fn e, a ->
        Enum.with_index(e)
        |> Enum.map(fn {v, i} -> v + Enum.at(a, i) end)
      end)

    bit_count = Enum.at(res, index)

    Enum.filter(power, fn entry ->
      bit = if bit_count >= len / 2, do: 0, else: 1
      Enum.at(entry, index) == bit
    end)
    |> filter_co2(index + 1, line_size)
  end
end
