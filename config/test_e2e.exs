use Mix.Config

# Configure your database
config :hello, Hello.Repo,
  username: "postgres",
  password: "postgres",
  database: "hello_test",
  hostname: System.get_env("POSTGRES_HOST") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello, HelloWeb.Endpoint,
  http: [port: 4002],
  server: false

config :hello, HelloWeb.Endpoint,
  http: [port: 4002],
  server: true

config :hello, :sql_sandbox, true

config :wallaby,
  driver: Wallaby.Selenium,
  otp_app: :hello,
  hackney_options: [timeout: 5000]

# Print only warnings and errors during test
config :logger, level: :warn
