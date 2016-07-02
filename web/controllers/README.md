# API Documentation

* [AmericanPhoenix.SessionController](#americanphoenixsessioncontroller)
  * [create](#americanphoenixsessioncontrollercreate)
* [AmericanPhoenix.UserController](#americanphoenixusercontroller)
  * [create](#americanphoenixusercontrollercreate)

## AmericanPhoenix.SessionController
### AmericanPhoenix.SessionController.create
#### POST /api/sessions
##### Request
* __Method:__ POST
* __Path:__ /api/sessions
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "user": {
    "password": "12345abc",
    "email": "foo@bar.com"
  }
}
```
##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: c5p7ppftac2l6d68aqd5d50ru32a3see
```
* __Response body:__
```json
{
  "data": {
    "token": "jzBdn2Uq5Sv_nilTnuTuRA"
  }
}
```

## AmericanPhoenix.UserController
### AmericanPhoenix.UserController.create
#### POST /api/users
##### Request
* __Method:__ POST
* __Path:__ /api/users
* __Request headers:__
```
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "user": {
    "password": "foobar123",
    "email": "foo@bar.com"
  }
}
```
##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: p3l8tbfd2tgtv7tte179cmcdjdu8fns3
```
* __Response body:__
```json
{
  "data": {
    "id": 68,
    "email": "foo@bar.com",
    "access_token": "MJW65kkMrtzbywRZDKXkWQ"
  }
}
```

