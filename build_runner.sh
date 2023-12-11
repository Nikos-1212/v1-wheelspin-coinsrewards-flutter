set -ex

(cd wheelspin_coins_rewards;flutter pub run build_runner build --delete-conflicting-outputs)
(cd test_app; flutter pub run build_runner build --delete-conflicting-outputs)