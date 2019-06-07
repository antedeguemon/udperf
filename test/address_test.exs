defmodule AddressTest do
  use ExUnit.Case
  alias Udperf.Address
  doctest Address

  describe "ipv4" do
    test "parses a valid ip into an inet address" do
      parsed_address = :inet.parse_address('127.0.0.1') |> elem(1)
      assert Address.ipv4("127.0.0.1") == parsed_address
    end

    test "returns error when parsing an invalid ip" do
      assert Udperf.Address.ipv4("abc.122.abc.123") == :error
    end
  end
end
