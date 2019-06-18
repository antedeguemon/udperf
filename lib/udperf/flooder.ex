defmodule Udperf.Flooder do
  use GenServer
  alias Udperf.Client

  def init({address, length, discrete_time}) do
    :timer.send_interval(discrete_time, self(), :flood)
    {:ok, {address, length, discrete_time}}
  end

  def handle_info(:flood, {address, rate, discrete_time}) do
    Client.send_data(address, rate)
    {:noreply, {address, rate, discrete_time}}
  end

  def start_link(address, bandwidth, discrete_time \\ 1) do
    cycles = 1000 / discrete_time
    rate = trunc(bandwidth / cycles)

    GenServer.start_link(__MODULE__, {address, rate, discrete_time})
  end
end
