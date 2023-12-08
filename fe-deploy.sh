
#!/bin/bash
 

if [[ $GITHUB_REF == refs/heads/dev ]]; then
ENV_FILE=".env.dev"
elif [[ $GITHUB_REF == refs/heads/qa ]]; then
ENV_FILE=".env.qa"
elif [[ $GITHUB_REF == refs/heads/main ]]; then
ENV_FILE=".env.prod"
else
echo "Unknown branch. Unable to determine environment."
exit 1
fi
# Create the .env file based on the determined environment
echo "Creating $ENV_FILE..."
echo "REACT_APP_API_BASE = $(grep "REACT_APP_API_BASE" $ENV_FILE)" > .env
cat .env

