defmodule Udperf.Address do
  defstruct [:host, :port]

  def new(host, port) when is_binary(host) do
    %Udperf.Address{
      host: ipv4(host),
      port: port
    }
  end

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
