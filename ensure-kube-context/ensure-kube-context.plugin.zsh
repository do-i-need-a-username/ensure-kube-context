# ensure-kube-context.plugin.zsh
for module in "${ENSURE_KUBE_CONTEXT_MODULES[@]}"; do
  case $module in
    kubectl)
      command -v kubectl >/dev/null 2>&1 && source "${0:A:h}/ensure-kube-context-kubectl.plugin.zsh"
      ;;
    cilium)
      command -v cilium >/dev/null 2>&1 && source "${0:A:h}/ensure-kube-context-cilium.plugin.zsh"
      ;;
    stern)
      command -v stern >/dev/null 2>&1 && source "${0:A:h}/ensure-kube-context-stern.plugin.zsh"
      ;;
    *)
      echo "Unknown module in ENSURE_KUBE_CONTEXT_MODULES: $module"
      ;;
  esac
done
