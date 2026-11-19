#!/usr/bin/env bash
# Dependency-free structure check for course repos. Run from the repo root.
fail=0
err() { echo "ERROR: $*"; fail=1; }

for f in README.md COURSE.md SETUP.md CONTRIBUTING.md CHANGELOG.md \
         other/docs/JD.md other/slides/README.md other/datasets/README.md \
         other/README.md org/datafabric-academy.md org/onto-iq.md; do
  [ -f "$f" ] || err "missing file: $f"
done
for d in lessons labs other other/assets other/datasets other/slides \
         other/docs other/reference other/scripts org; do
  [ -d "$d" ] || err "missing folder: $d/"
done

if [ -f COURSE.md ]; then
  for k in course_name repo_url org lessons_path labs_path other_path deck_path jd_source; do
    grep -q "^$k:" COURSE.md || err "COURSE.md missing key: $k"
  done
fi

n=0
for l in lessons/*/; do
  [ -d "$l" ] || continue
  n=$((n+1)); s=$(basename "$l")
  echo "$s" | grep -Eq '^[0-9]{2}-[a-z0-9]+(-[a-z0-9]+)*$' || err "lesson folder must be NN-slug: $l"
  [ -f "$l/README.md" ] || err "missing ${l}README.md"
  [ -f "$l/LESSON.md" ] || err "missing ${l}LESSON.md"
  lab="labs/$s"
  if [ -d "$lab" ]; then
    [ -f "$lab/README.md" ] || err "missing $lab/README.md"
    [ -f "$lab/LAB.md" ] || err "missing $lab/LAB.md"
    [ -d "$lab/starter" ] || err "missing $lab/starter/"
    [ -d "$lab/solution" ] || err "missing $lab/solution/"
  else
    err "lesson without matching lab folder: $lab"
  fi
done
[ "$n" -ge 1 ] || err "no lessons found in lessons/"

for lab in labs/*/; do
  [ -d "$lab" ] || continue
  [ -d "lessons/$(basename "$lab")" ] || err "lab without matching lesson: $lab"
done

[ "$fail" -eq 0 ] && echo "Structure OK ($n lessons / labs)"
exit $fail
