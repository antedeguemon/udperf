defmodule Udperf do
  @udp_client_port 3222

  def start(_type, _args) do
    children = [
      {UdpFlood.Client, @udp_client_port}
    ]

    opts = [strategy: :one_for_one, name: A.Supervisor, restart: :transient]
    Supervisor.start_link(children, opts)
  end
end
