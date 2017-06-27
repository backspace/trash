rubies_array=( $(
    rvm list strings \
      | while read -r v; do
          if [[ ! "${v}" =~ <%= internal_ruby_regex %> ]]; then
            continue
          fi
          v="${v//ruby-/}"
          v="${v%%-*}"
          echo "$(vers2int "${v}")_${v}"
        done
  ) )

echo $rubies_array
