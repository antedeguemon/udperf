# udperf

Floods 127.0.0.1:8080 with 10000 bytes per second, 10 bytes per ms:
```
Udperf.Address.new("127.0.0.1", 6666)
|> Udperf.Flood(10000, 1)
```

