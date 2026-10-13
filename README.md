# GenAI Images Learning

Simple project for testing a static site generator, based on content created while learning Generative AI for images.

## Repository migration

This repository has been migrated from GitHub to GitLab. The GitLab repository is
the source of truth; the GitHub copy is redundant and will no longer be updated.

- GitLab: https://gitlab.com/marcinpraczko/genai-imgs-learning
- GitLab Pages: https://marcinpraczko.gitlab.io/genai-imgs-learning/
- GitHub (legacy): https://github.com/marcinpraczko/genai-imgs-learning

## Build locally

Dependencies are managed with [uv](https://docs.astral.sh/uv/)
(`pyproject.toml` + `uv.lock`).

```sh
make build-website
```

This creates `.venv` if needed, installs the locked dependencies and builds the
site into `website/build/html/`. Run `make help` for all targets.

GitLab CI runs `make build-pages` on every branch and stores the result in the
`public` artifact.
