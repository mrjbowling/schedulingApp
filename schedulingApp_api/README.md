# SchedulingAppApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# terminal command example
 * iex -S mix
 * alias SchedulingAppApi.Repo
 * alias SchedulingAppApi.Accounts.User
 *  x = User.changeset(%User{}, %{first_name: "Harry", last_name: "Potter", email: "Harry@potter.com", password: "testing", password_confirmation: "testing"})
 * Repo.insert(x)

 # graphql example
  *  mix phx.server
  * go to http://localhost:4000/graphiql
  * search 
  {
  users {
    id
    firstName
    lastName
    role
  }
}
* create new user
mutation {
  registerUser(input: {email:"test@test.com", firstName:"tester", lastName:"test", password:"", passwordConfirmation:"" }) {
    id
  }
}


Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
