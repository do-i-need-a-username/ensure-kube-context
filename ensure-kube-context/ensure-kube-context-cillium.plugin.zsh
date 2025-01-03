# Function: enforce_context_cilium
# This function ensures that the `--context` flag is included in `cilium` commands
# except for help, version, and other safe subcommands that don't need it.
function enforce_context_cilium() {
  local safe_subcommands=(
    "help"
    "version"
    "completion"
    "status"
    "config"
    "monitor"
    "hub"
  )
  local found_context=false
  local first_arg=$1

  # Check if the first argument is in the list of safe subcommands
  for subcommand in "${safe_subcommands[@]}"; do
    if [[ "$first_arg" == "$subcommand" ]]; then
      # If the subcommand is safe, run the command without checking --context
      command cilium "$@"
      return
    fi
  done

  # Check if the --context flag is provided
  for arg in "$@"; do
    if [[ "$arg" == "--context" ]]; then
      found_context=true
      break
    fi
  done

  # If --context is not found, print an error and exit
  if [[ "$found_context" == false ]]; then
    echo "Error: The --context flag must be provided for this cilium command."
    return 1
  fi

  # Run the command with all provided arguments
  command cilium "$@"
}

# Override the cilium function
function cilium() {
  enforce_context_cilium "$@"
}
