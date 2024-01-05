#### A. Analyse 
```
SLDEBIAN02:~$ curl -I http://X.X.X.X:8000
```

```
HTTP/1.1 200 OK
Content-type: text/html; charset=utf-8
Content-Security-Policy: default-src 'self' 'unsafe-inline' data: https://www.google.com; connect-src *; script-src 'self' 'unsafe-eval' 'unsafe-inline' blob:; img-src 'self' data: blob: *; media-src * blob:; worker-src blob: data: *
X-XSS-Protection: 1
X-Frame-Options: SAMEORIGIN
X-Content-Type-Options: nosniff
Date: Fri, 05 Jan 2024 14:52:43 GMT
Server: LHS
```
