# Devchallenge 1101

## API reference

##### POST /password
Request body:
```
{
  "password": {
    "value": "qwerty",
    "available_util": "07-10-2018"
  }
}
```
Response:
```
{
  "password": {
    "url": "http://localhost:2300/passwords/slug"
  }
}
```

##### POST /passwords
Request body:
```
{
  "passwords": [{
    "value": "qwerty",
    "available_utill": "07-10-2018"
  }, {
    "value": "12345",
    "available_utill": "12-10-2018"
  }]
}
```
Response body:
```
{
  "passwords": [{
    "url": "http://localhost:2300/passwords/slug"
  }, {
    "url": "http://localhost:2300/password/another_slug"
  }]
}
```
