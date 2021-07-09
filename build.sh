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