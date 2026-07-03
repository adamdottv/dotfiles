# Shows indexes 0-15 with their RGB values
for i in {0..15}; do
  printf "\033[48;5;%sm %2s \033[0m" "$i" "$i"
done
echo
