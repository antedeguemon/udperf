# udperf

Floods 127.0.0.1:8080 with 10000 bytes per second, 10 bytes per ms:
```
Udperf.Address.new("127.0.0.1", 6666)
|> Udperf.Flood(10000, 1)
```

Floods 127.0.0.1:8080 with 10000 bytes per second, using 10 processes.
```
address = Udperf.Address.new("127.0.0.1", 6666)
Enum.each((1..10), fn _ -> 
  spawn(fn ->
    Udperf.Flood(address, 1000, 1)
  end)
end)

```

