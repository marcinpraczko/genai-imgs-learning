GenAI Images Learning
=====================

Simple project for testing a static site generator, based on content created
while learning Generative AI for images.

Repository migration
--------------------

This repository has been migrated from GitHub to GitLab. The GitLab repository
is the source of truth; the GitHub copy is redundant and will no longer be
updated.

- GitLab: https://gitlab.com/marcinpraczko/genai-imgs-learning
- GitLab Pages: https://marcinpraczko.gitlab.io/genai-imgs-learning/
- GitHub (legacy): https://github.com/marcinpraczko/genai-imgs-learning

Build locally
-------------

Dependencies are managed with `uv <https://docs.astral.sh/uv/>`_
(``pyproject.toml`` and ``uv.lock``)::

    make build-website

The site is generated in ``website/build/html/``. Run ``make help`` for all
targets.

Resources
---------

- https://www.sphinx-doc.org/en/master/usage/installation.html
- https://ablog.readthedocs.io/en/stable/
- https://www.errbufferoverfl.me/posts/2020/sphinx-blog-part-one/
