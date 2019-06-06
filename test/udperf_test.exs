defmodule UdperfTest do
  use ExUnit.Case
  doctest Udperf

  test "greets the world" do
    assert Udperf.hello() == :world
  end
end
