sync-website-to-doc-folder:
	rsync -av --delete website/source/_website/ docs/
