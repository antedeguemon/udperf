defmodule Udperf.Flooder do
  use GenServer

  def init({address, length, discrete_time}) do
    # minimum_unit = bandwith / discrete_time
    :timer.send_interval(discrete_time, self(), :flood)
    {:ok, {address, length, discrete_time}}
  end

  def handle_info(:flood, {address, rate, discrete_time}) do
    Client.send_data(address, rate)
    {:noreply, {address, rate, discrete_time}}
  end

  # External API

  def start_link(address, bandwidth, discrete_time \\ 1) do
    cycles = 1000 / discrete_time
    rate = trunc(bandwidth / cycles)
    
    GenServer.start_link(__MODULE__, {address, rate, discrete_time})
  end
end
