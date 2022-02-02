import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pavonz, PavonzWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wFfaiR8kHBmN2vfYFq2I5/XF6R8NYrk1eOqlROu1GK7zmpAE523Z2tFY5DV38ilN",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
