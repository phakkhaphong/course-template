---
# Machine-readable course manifest. Keep every key; use "" when unknown.
# Tools (deck composers, structure checks, bots) read this block first.
course_name: "<ชื่อคอร์ส / Course name>"
course_code: ""                 # e.g. SQL-ESS-01 or VIBE-CODE-L2
org: ""                         # DataFabric-Academy | Onto-IQ
language: "th"                  # th | en | th+en
duration: ""                    # e.g. "2 days"
repo_url: "https://github.com/<owner>/<repo>"
lessons_path: "lessons/"
labs_path: "labs/"
other_path: "other/"
deck_path: "other/slides/"      # folder here, or put the external deck URL in other/slides/README.md
datasets_path: "other/datasets/"
assets_path: "other/assets/"
jd_source: ""                   # Obsidian note path, e.g. Courses/<course-name>.md
jd_file: "other/docs/JD.md"
status: "draft"                 # draft | ready | archived
---

# COURSE.md

Course manifest for this repo. The fields in the front matter above are the
contract: tools read them instead of guessing paths. If you move a folder,
update the matching `*_path` field. `other/scripts/check_structure.sh` fails
when a required key is missing.
