# Pipeline source
GITHUB_REPO=https://github.com/santerisalonen/amplify-test

# Github access configured for regions: eu-west-1 (Ireland), eu-central-1 (Frankfurt), eu-north-1 (Stockholm)
GITHUB_TOKEN='{{resolve:secretsmanager:github-access-token-santerisalonen:SecretString:GithubAccessToken}}'

# DomainName
DOMAIN_NAME=poimisto.com

REGION=eu-west-1

STACK_NAME=amplify-test-cf

aws cloudformation deploy \
  --template-file ./pipeline.yml \
  --capabilities CAPABILITY_IAM \
  --region $REGION \
  --parameter-overrides \
      GitHubAccessToken=$GITHUB_TOKEN \
      GithubRepo=$GITHUB_REPO \
      DomainName=$DOMAIN_NAME \
  --stack-name $STACK_NAME