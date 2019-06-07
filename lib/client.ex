defmodule Udperf.Client do
  use GenServer

  def init(port) do
    case :gen_udp.open(port) do
      {:ok, socket} -> {:ok, [socket: socket]}
      {:error, _} -> {:stop, :invalid_udp}
    end
  end

  def handle_cast({:send_data, address, length}, socket: socket) do
    spawn_link(fn ->
      :gen_udp.send(
        socket,
        address.host,
        address.port,
        String.duplicate("a", length)
      )
    end)

    {:noreply, [socket: socket]}
  end

  def handle_info(_, state) do
    # may render ocasional udp response
    {:noreply, state}
  end

  def start_link(port \\ 666) do
    GenServer.start_link(__MODULE__, port, name: __MODULE__)
  end

  def send_data(address, length) do
    GenServer.cast(__MODULE__, {:send_data, address, length})
  end
end
