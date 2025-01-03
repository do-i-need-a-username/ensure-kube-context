# Function: enforce_context_helm
# This function ensures that the `--kube-context` flag is included in `helm` commands
# except for help, version, and other safe subcommands that don't need it.
function enforce_context_helm() {
  local safe_subcommands=(
    "help"
    "version"
    "completion"
    "list"
    "status"
    "history"
    "rollback"
  )
  local found_context=false
  local first_arg=$1

  # Check if the first argument is in the list of safe subcommands
  for subcommand in "${safe_subcommands[@]}"; do
    if [[ "$first_arg" == "$subcommand" ]]; then
      # If the subcommand is safe, run the command without checking --kube-context
      command helm "$@"
      return
    fi
  done

  # Check if the --kube-context flag is provided
  for arg in "$@"; do
    if [[ "$arg" == "--kube-context" ]]; then
      found_context=true
      break
    fi
  done

  # If --kube-context is not found, print an error and exit
  if [[ "$found_context" == false ]]; then
    echo "Error: The --kube-context flag must be provided for this helm command."
    return 1
  fi

  # Run the command with all provided arguments
  command helm "$@"
}

# Override the helm function
function helm() {
  enforce_context_helm "$@"
}
