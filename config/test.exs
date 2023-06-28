import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :basic, BasicWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "CgMf9A/SGqs+cqsGvnuu5mxXhB3/RX5p9pFYcy2GGzLCOIfLwEAfBb2WyPR6hIXo",
  server: false

# In test we don't send emails.
config :basic, Basic.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
