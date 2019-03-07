A docker image intended to host a Joomla site, complete with a MySQL server

If apt can't resolve its mirrors put this in `/etc/docker/daemon.json`:

```
{
    "dns": ["x.x.x.x", "y.y.y.y"]
}
```

(Replace x/y with your DNS servers)
