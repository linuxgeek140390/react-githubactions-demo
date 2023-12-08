
#!/bin/sh
 
CURR_BRANCH=$(git status| head -1 | awk '{print $NF}')
if [ "$CURR_BRANCH" == "dev" ]; then
ENV_FILE=".env.dev"
elif [ "$CURR_BRANCH" == "qa" ]; then
ENV_FILE=".env.qa"
elif [ "$CURR_BRANCH" == "main" ]; then
ENV_FILE=".env.prod"
else
echo "Unknown branch. Unable to determine environment."
exit 1
fi
# Create the .env file based on the determined environment
echo "Creating $ENV_FILE..."
echo "REACT_APP_API_BASE = $(grep "REACT_APP_API_BASE" $ENV_FILE)" > .env
cat .env
