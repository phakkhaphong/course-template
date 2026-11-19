#!/usr/bin/env bash
# Dependency-free structure check for course repos. Run from the repo root.
fail=0
err() { echo "ERROR: $*"; fail=1; }

for f in README.md COURSE.md SETUP.md CONTRIBUTING.md CHANGELOG.md \
         other/docs/JD.md other/slides/README.md other/datasets/README.md \
         other/README.md org/datafabric-academy.md org/onto-iq.md; do
  [ -f "$f" ] || err "missing file: $f"
done
for d in lessons exercises other other/assets other/datasets other/slides \
         other/docs other/reference other/scripts org; do
  [ -d "$d" ] || err "missing folder: $d/"
done

if [ -f COURSE.md ]; then
  for k in course_name repo_url org lessons_path exercises_path other_path deck_path jd_source; do
    grep -q "^$k:" COURSE.md || err "COURSE.md missing key: $k"
  done
fi

n=0
for l in lessons/*/; do
  [ -d "$l" ] || continue
  n=$((n+1)); s=$(basename "$l")
  echo "$s" | grep -Eq '^[0-9]{2}-[a-z0-9]+(-[a-z0-9]+)*$' || err "lesson folder must be NN-slug (ASCII): $l"
  [ -f "$l/README.md" ] || err "missing ${l}README.md"
  [ -f "$l/LESSON.md" ] || err "missing ${l}LESSON.md"
  ex="exercises/$s"
  if [ -d "$ex" ]; then
    [ -f "$ex/README.md" ] || err "missing $ex/README.md"
    [ -f "$ex/LAB.md" ] || err "missing $ex/LAB.md"
    [ -d "$ex/starter" ] || err "missing $ex/starter/"
    [ -d "$ex/solution" ] || err "missing $ex/solution/"
  else
    err "lesson without matching exercise folder: $ex"
  fi
done
[ "$n" -ge 1 ] || err "no lessons found in lessons/"

for ex in exercises/*/; do
  [ -d "$ex" ] || continue
  s=$(basename "$ex")
  echo "$s" | grep -Eq '^[0-9]{2}-[a-z0-9]+(-[a-z0-9]+)*$' || err "exercise folder must be NN-slug (ASCII): $ex"
  [ -d "lessons/$s" ] || err "exercise without matching lesson: $ex"
done

[ "$fail" -eq 0 ] && echo "Structure OK ($n lessons / exercises)"
exit $fail
