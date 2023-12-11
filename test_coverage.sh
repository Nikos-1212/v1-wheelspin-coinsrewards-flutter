set -e

function generateCoverage {
  echo "Generating test coverage for wheelspin_coins_rewards"
  (cd wheelspin_coins_rewards; flutter test --coverage)
  (cd wheelspin_coins_rewards/coverage; sed -i '' "s|SF:lib/|SF:wheelspin_coins_rewards/lib/|g" lcov.info)

  echo "Combining all coverage into file://$(pwd)/all_coverage/combined-coverage.info"
  lcov --add-tracefile wheelspin_coins_rewards/coverage/lcov.info --base-directory wheelspin_coins_rewards/lib --no-external -d wheelspin_coins_rewards \
       --output-file all_coverage/combined-coverage.info
  echo "Generating html file test coverage for wheelspin_coins_rewards"
  genhtml all_coverage/combined-coverage.info --output-directory all_coverage/html --show-details
  echo "Open this file file://$(pwd)/all_coverage/html/index.html"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  if command -v lcov >/dev/null 2>&1; then
    generateCoverage
  else
    echo "lcov is not installed in mac"
    echo "Installing lcov using this command 'brew install lcov'"
    brew install lcov
    generateCoverage
  fi
elif [[ "$OSTYPE" == "msys" ]]; then
  if where lcov >/dev/null 2>&1; then
    generateCoverage
  else
    echo "lcov is not installed in windows"
    echo "Please refer to the following link for more information: https://github.com/linux-test-project/lcov."
  fi
else
  echo "Unknown operating system"
fi