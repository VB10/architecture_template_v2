#!/bin/bash
# Run this script at the root

function clean_module {
  local module="$1"
  if [ -d "$module" ]; then
    echo "Cleaning module: $module"
    (cd "$module" && flutter clean && rm -f pubspec.lock && flutter pub get)
  fi
}

cd module
# Traverse all modules dynamically
for module in */; do
  clean_module "$module"
done
cd ..

# Clean the main project
echo "Cleaning main project"
flutter clean && rm -f pubspec.lock && flutter pub get



