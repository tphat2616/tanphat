# pull git
sudo git pull
tphat2616@gmail.com | command-that-asks-for-input
a09098237720 | command-that-asks-for-input

# Stop previous run
sudo _build/prod/rel/tanphat/bin/tanphat stop

# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

# Install / update  JavaScript dependencies
npm install --prefix ./assets

# Compile assets
npm run deploy --prefix ./assets
MIX_ENV=prod mix phx.digest

# Release
MIX_ENV=prod mix release
yes | command-that-asks-for-input
sudo _build/prod/rel/tanphat/bin/tanphat daemon_iex