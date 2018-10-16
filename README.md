# Devchallenge 1101

Application receives a value and returns a link, that can be shared with another person.
Value is stored in encrypted form.
Link will be available only once.

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
    "url": "http://localhost:8080/passwords/<slug>"
  }
}
```

Second try to see password will show
```
{
  "errors":["Password was already shown!"]
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
    "url": "http://localhost:8080/passwords/<slug>"
  }, {
    "url": "http://localhost:8080/password/<another_slug>"
  }]
}
```
