defmodule Udperf.Address do
  defstruct [:host, :port]

  def ipv4(host) do
    case parse_ipv4(host) do
      {:ok, x} -> x
      {:error, _} -> :error
    end
  end

  defp parse_ipv4(host) do
    host
    |> String.to_charlist()
    |> :inet.parse_address()
  end
end
