# Function: enforce_context_kustomize
# This function ensures that the `--context` flag is included in `kustomize` commands
# except for help, version, and other safe subcommands that don't need it.
function enforce_context_kustomize() {
  local safe_subcommands=(
    "help"
    "version"
    "build"
    "cfg"
    "edit"
    "openapi"
  )
  local found_context=false
  local first_arg=$1

  # Check if the first argument is in the list of safe subcommands
  for subcommand in "${safe_subcommands[@]}"; do
    if [[ "$first_arg" == "$subcommand" ]]; then
      # If the subcommand is safe, run the command without checking --context
      command kustomize "$@"
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
    echo "Error: The --context flag must be provided for this kustomize command."
    return 1
  fi

  # Run the command with all provided arguments
  command kustomize "$@"
}

# Override the kustomize function
function kustomize() {
  enforce_context_kustomize "$@"
}
