# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Learning to use Generative AI for images'
copyright = '2024-2026, Marcin Prączko'
author = 'Marcin Prączko'
release = '0.1.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "ablog",
]

html_theme = "pydata_sphinx_theme"
html_static_path = []

# -- ABLOG --
post_auto_image = 1
html_theme_options = {
    "navigation_with_keys": False,
    "navbar_align": "right",
    "logo": {
        "text": "Marcin Prączko Gen AI for Images blog",
    }
}
html_sidebars = {
   '**': ['ablog/postcard.html', 'ablog/recentposts.html',
          'ablog/tagcloud.html', 'ablog/categories.html',
          'ablog/archives.html', ]
}
