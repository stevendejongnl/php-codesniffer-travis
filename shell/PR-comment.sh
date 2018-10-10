#!/bin/bash
set -ev
if [ "$TRAVIS_PULL_REQUEST" != "false" ] && [ $TRAVIS_BRANCH = 'master' ]; then
   # hey that's a pull request not into develop
   curl -H "Authorization: token ${GITHUB_TOKEN}" -X POST \
    -d "{\"body\": \"Build success! 👍 Let's merge into master! \"}" \
    "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/issues/${TRAVIS_PULL_REQUEST}/comments"

    echo "PR success!"
fi

if [ ${TRAVIS_PULL_REQUEST} != "false" ] && [ "$TRAVIS_BRANCH" = "develop" ]; then
  # hey that's a pull request into develop
   curl -H "Authorization: token ${GITHUB_TOKEN}" -X POST \
    -d "{\"body\": \"Build success! 👍 Ask your PO to review your PR \"}" \
    "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/issues/${TRAVIS_PULL_REQUEST}/comments"

    echo "PR success!"
fi

if [ "$TRAVIS_PULL_REQUEST" != "false" ] && [ $TRAVIS_BRANCH != 'master' ] && [ $TRAVIS_BRANCH != 'develop' ]; then
   # hey that's a pull request not into develop
   curl -H "Authorization: token ${GITHUB_TOKEN}" -X POST \
    -d "{\"body\": \"Build success! 👍 Let your whole team review this PR \"}" \
    "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/issues/${TRAVIS_PULL_REQUEST}/comments"

    echo "PR success!"
fi
