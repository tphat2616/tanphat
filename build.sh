export SECRET_KEY_BASE=`mix phx.gen.secret 64`

# Stop previous run
sudo _build/prod/rel/tanphat/bin/tanphat stop
# _build/prod/rel/client_25plus_gateway/bin/client_25plus_gateway

# Remove the existing release directory and build the release
sudo rm -rf "_build"

#!/usr/bin/env bash
# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

# Release
MIX_ENV=prod mix release
sudo _build/prod/rel/tanphat/bin/tanphat daemon_iex