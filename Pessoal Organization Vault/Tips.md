### Kill a process

```
sudo lsof -i :3000
```

``` 
kill -9 PID
``` 


OR 


```
fuser -k 3000/tcp
```