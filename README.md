# Devchallenge 1101

## API reference

##### POST /passwords
Request body:
```
{
  "password": {
    "value": "qwerty",
    "available_until": "07-10-2018"
  }
}
```
Response:
```
{
  "password": {
    "url": "http://localhost:2300/passwords/<slug>"
  }
}
```

##### POST /passwords/batch
Request body:
```
{
  "passwords": [{
    "value": "qwerty",
    "available_until": "07-10-2018"
  }, {
    "value": "12345",
    "available_until": "12-10-2018"
  }]
}
```
Response body:
```
{
  "passwords": [{
    "url": "http://localhost:2300/passwords/<slug>"
  }, {
    "url": "http://localhost:2300/password/<another_slug>"
  }]
}
```
