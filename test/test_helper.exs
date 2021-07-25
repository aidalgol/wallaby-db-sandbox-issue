case Mix.env() do
  :test ->
    ExUnit.configure(exclude: [:end_to_end])

  :test_e2e ->
    # This hack is to workaround Firefox under docker-compose not resolving
    # container hostnames.  Set in the entrypoint script for the phoenix
    # container.
    Application.put_env(:wallaby, :base_url, "http://#{System.get_env("PHOENIX_IP4")}:4002")
    {:ok, _} = Application.ensure_all_started(:wallaby)
    ExUnit.configure(exclude: [:test], include: [:end_to_end])
end

ExUnit.start()
