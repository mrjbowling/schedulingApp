defmodule SchedulingAppApiWeb.Schema do
use Absinthe.Schema

alias SchedulingAppApiWeb.Resolvers
alias SchedulingAppApiWeb.Schema.Middleware

import_types(SchedulingAppApiWeb.Schema.Types)


query do
  @desc "Get a list of all users"
  field :users, list_of(:user_type) do
    middleware(Middleware.Authorize, :any)
    resolve(&Resolvers.UserResolver.users/3)
  end
end

mutation do
  @desc "Register a new user"
  field :register_user, type: :user_type do
    arg(:input, non_null(:user_input_type))
    resolve(&Resolvers.UserResolver.register_user/3)
end

@desc "Login a user and return a JWT token"
field :login_user, type: :session_type do
  arg(:input, non_null(:session_input_type))
  resolve(&Resolvers.SessionResolver.login_user/3)
end

  @desc "Create a schedule event"
  field :create_schedule, type: :schedule_type do
    arg(:input, non_null(:schedule_input_type))
    resolve(&Resolvers.ScheduleResolver.create_schedule/3)
end
end

def context(ctx) do
  loader =
    Dataloader.new
    |> Dataloader.add_source(Blog, Blog.data())
    |> Dataloader.add_source(Foo, Foo.data()) # Foo source could be a Redis source

  Map.put(ctx, :loader, loader)
end

def plugins do
  [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
end
end
