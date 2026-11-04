#!/usr/bin/env bash
# Extract ```yaml blocks from README.md and validate them with kubeconform (strict).
# A block preceded by a line `<!-- skip-validate -->` is skipped (partial snippets).
set -euo pipefail
K8S_VERSION="${K8S_VERSION:-1.37.0}"
dir=$(mktemp -d); trap 'rm -rf "$dir"' EXIT
python3 -I - "$dir" <<'PY'
import re, sys
t = open('README.md', encoding='utf-8').read()
for m in re.finditer(r'(<!-- skip-validate -->\n)?```ya?ml\n(.*?)```', t, re.S):
    if not m.group(1):
        open(f"{sys.argv[1]}/line{t[:m.start()].count(chr(10)) + 2:04d}.yaml", 'w').write(m.group(2))
PY
kubeconform -strict -summary -kubernetes-version "$K8S_VERSION" "$dir"
