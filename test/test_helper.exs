ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(AmericanPhoenix.Repo, :manual)

# Use Bureaucrat for automatically generating API documentation from test cases
Bureaucrat.start
ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter])
