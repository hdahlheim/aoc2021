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
    acc = get_bit_counter_list(power)

    bits = count_bits(power, acc)

    gamma =
      Enum.map(bits, fn bit_count -> if bit_count >= len / 2, do: 1, else: 0 end)
      |> Enum.join()
      |> String.to_integer(2)

    epsilon =
      Enum.map(bits, fn bit_count -> if bit_count >= len / 2, do: 0, else: 1 end)
      |> Enum.join()
      |> String.to_integer(2)

    Enum.product([gamma, epsilon])
    |> IO.inspect()
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
    counter = get_bit_counter_list(power)
    oxygen = filter_bits(power, :oxygen, 0, counter)
    co2 = filter_bits(power, :co2, 0, counter)

    co2 * oxygen
  end

  defp filter_bits([val], _, _, _), do: val |> Enum.join() |> String.to_integer(2)

  defp filter_bits(power, type, index, counter) do
    len = length(power)

    {t, f} = get_filter_bits(type)

    bit_count =
      count_bits(power, counter)
      |> Enum.at(index)

    bit = if bit_count >= len / 2, do: t, else: f

    Enum.filter(power, fn entry ->
      Enum.at(entry, index) == bit
    end)
    |> filter_bits(type, index + 1, counter)
  end

  defp count_bits(power, acc) do
    Enum.reduce(power, acc, fn e, a ->
      Enum.with_index(e)
      |> Enum.map(fn {v, i} -> v + Enum.at(a, i) end)
    end)
  end

  defp get_bit_counter_list(power) do
    accLen = Enum.at(power, 0) |> length()
    Enum.reduce(1..accLen, [0], fn _, acc -> [0 | acc] end)
  end

  defp get_filter_bits(:oxygen), do: {1, 0}
  defp get_filter_bits(:co2), do: {0, 1}
end
