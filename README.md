# ensure-kube-context

A ZSH plugin to ensure the --context flag is passed to kubectl.

## Install

Oh My Zsh

Clone the repository:

```bash
git clone --depth=1 https://github.com/do-i-need-a-username/ensure-kube-context.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/ensure-kube-context
```

Open ~/.zshrc and set ENSURE_KUBE_CONTEXT_COMMANDS to a list of commands you want to force the --context flag on.

```bash
# .zshrc
ENSURE_KUBE_CONTEXT_COMMANDS=(kubectl cilium stern)
```
