#!/usr/bin/env bash
# Compiles every test document and reports the checks that failed.
# Usage, from anywhere:  bash tests/run.sh
#
# The documents are compiled from the root of the repository, so that the
# class, the logos and the fonts are found in the current directory, as a
# user has them next to the letter. A document fails if it does not
# compile, if one of its checks fails (see tests/checks.tex), or if the log
# of the last run has a warning: a missing glyph, a substituted font, an
# overfull box.

cd "$(dirname "$0")/.." || exit 1

out=_build/tests
bad='TEST FAILED|Font Warning|Overfull|Missing character|not found'
export max_print_line=1000    # keep every message of the log in one line
status=0

for f in tests/*.tex; do
	name=$(basename "$f" .tex)
	[ "$name" = checks ] && continue
	log=$out/$name.log

	if ! latexmk -pdf -interaction=nonstopmode -halt-on-error \
			-outdir=$out -auxdir=$out "$f" > /dev/null 2>&1; then
		echo "FAILED  $name: does not compile, see $log"
		status=1
		continue
	fi

	problems=$(grep -E "$bad" "$log")
	if [ -n "$problems" ] || ! grep -q 'TEST OK' "$log"; then
		echo "FAILED  $name"
		echo "$problems"
		status=1
	else
		echo "ok      $name ($(grep -c 'TEST OK' "$log") checks)"
	fi
done

exit $status
