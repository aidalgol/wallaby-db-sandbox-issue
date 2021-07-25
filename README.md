# Hello

To reproduce the problem (requires docker-compose), run...

  1. `docker-compose run phoenix setup`
  2. `docker-compose run -e MIX_ENV="test_e2e" phoenix test`

The part of the output that is of interest to us is this:
```
Users from test: [
  %Hello.Accounts.User{
    __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
    id: 1,
    inserted_at: ~N[2021-07-25 04:31:36],
    name: "Alice",
    updated_at: ~N[2021-07-25 04:31:36],
    username: "allie"
  }
]
Users from controller: []
```

Which shows that the Wallaby test and the controller are not seeing the same data in the database.
