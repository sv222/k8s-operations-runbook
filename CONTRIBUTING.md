# Contributing

Fixes and improvements are welcome.

- Open an issue or a pull request with a focused change.
- Keep answers short and practical; prefer examples that run on a current Kubernetes release.
- Every YAML example in `README.md` must be a complete manifest. Check it with `scripts/check-yaml.sh` (needs [kubeconform](https://github.com/yannh/kubeconform)). Mark partial snippets with `<!-- skip-validate -->` on the line above the code block.
- Link to the official documentation at kubernetes.io where you can.
- Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages.

By contributing you agree that your changes are licensed under [CC BY 4.0](LICENSE).
