#!/bin/bash

# Proje dizini
project_dir="/Users/<username>/<projectname>"

# Modül dizini
module_dir="/Users/<username>/<projectname>/module/gen"

# Proje için build_runner çalıştırma fonksiyonu
run_build_runner_in_project() {
  local dir=$1

  # Proje dizininde build_runner çalıştırma işlemleri burada gerçekleştirilir
  cd "$dir"
  flutter packages pub run build_runner build --delete-conflicting-outputs
}

# Modül için build_runner çalıştırma fonksiyonu
run_build_runner_in_module() {
  local dir=$1

  # Modül dizininde build_runner çalıştırma işlemleri burada gerçekleştirilir
  cd "$dir"
  flutter packages pub run build_runner build --delete-conflicting-outputs
}

# Proje için build_runner çalıştır
run_build_runner_in_project "$project_dir"

# Modül için build_runner çalıştır
run_build_runner_in_module "$module_dir"
