defmodule ClientTest do
  use ExUnit.Case
  alias Udperf.Client
  doctest Client

  describe "initialization" do
    test "works when binding to unused port" do
      assert {:ok, pid} = Client.start_link(1212)
      assert Process.alive?(pid)
    end

    test "fails when starting on an already binded port" do
      Process.flag(:trap_exit, true)
      assert {:ok, _socket} = :gen_udp.open(1212)
      assert Client.start_link(1212) == {:error, :invalid_udp}
    end
  end
end
