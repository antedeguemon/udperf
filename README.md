# udperf
UDP performance testing tool written in Elixir using `gen_udp`.

### Usage
Floods 127.0.0.1:8080 with 10000 bytes per second, 10 bytes per ms:
```elixir
Udperf.Address.new("127.0.0.1", 8080)
|> Udperf.Flood(10000, 1)
```

Floods 127.0.0.1:8080 with 10000 bytes per second, using 10 processes.
```elixir
address = Udperf.Address.new("127.0.0.1", 8080)
Enum.each((1..10), fn _ -> 
  spawn(fn ->
    Udperf.Flood(address, 1000, 1)
  end)
end)

```

