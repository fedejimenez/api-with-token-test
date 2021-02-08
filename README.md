# api-with-token-test

## Endpoints 
There is only one endpoint for create/update a record

POST: `https://api-with-token-test.herokuapp.com/api/v1/test`

## Vallidation
A param `source_uuid: string` is required in every request.

## Authorization

Every request needs a token and a key to have access:

**Example with test TOKEN/KEY**

```
curl --request POST -H "Authorization: Token abc123, api_key=API_KEY_TEST" https://api-with-token-test.herokuapp.com/api/v1/test
```

Or it can be set up using a tool like Postman, adding a Header: `Authorization => Token abc123, api_key=API_KEY_TEST`
