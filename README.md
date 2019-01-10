# Try aws-record

- [aws/aws-sdk-ruby-record](https://github.com/aws/aws-sdk-ruby-record)
- [instructure/dynamo-local-admin](https://hub.docker.com/r/instructure/dynamo-local-admin)

## how to

start dynamodb local.

```
$ docker-compose up
#=> localhost:8000
```

```
$ bundle install
$ bundle exec ruby app.rb
```

## access to Dynamo local

- [DynamoDb shell](http://localhost:8002/shell)
- [dynamodb-admin](http://localhost:8000)