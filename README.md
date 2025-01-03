# ensure-kube-context

A ZSH plugin to ensure the `--context` flag is passed to various Kubernetes commands like `kubectl`, `cilium`, `stern`, and more.

## Install

### Oh My Zsh

1. **Clone the repository:**

```bash
git clone --depth=1 https://github.com/do-i-need-a-username/ensure-kube-context.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/ensure-kube-context
```

2. **Configure your .zshrc:**

Open `~/.zshrc` and set `ENSURE_KUBE_CONTEXT_MODULES` to a list of commands you want to enforce the `--context` flag on.

```bash
# .zshrc
ENSURE_KUBE_CONTEXT_MODULES=(kubectl cilium stern)
```

3. **Enable the plugin:**

Add `ensure-kube-context` to the plugins list in your `~/.zshrc` file:

```bash
plugins=(... ensure-kube-context)
```

4. **Apply changes:**

Source your `~/.zshrc` file to apply the changes:

```bash
source ~/.zshrc
```

## Usage

Once installed and configured, the plugin will automatically ensure that the `--context` flag is passed to the specified commands.

## Contributing

If you’d like to contribute to this project, please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License.
