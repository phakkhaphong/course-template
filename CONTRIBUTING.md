# Contributing / วิธีใช้เทมเพลตนี้สร้างคอร์สใหม่

## Create a new course under either org

1. Use this repository as a **GitHub template** (or clone and push to a new empty repo).
2. Target org:
   - **DataFabric-Academy** — data platform topics (see [org/datafabric-academy.md](org/datafabric-academy.md)).
   - **Onto-IQ** — AI topics (see [org/onto-iq.md](org/onto-iq.md)).
3. Edit `COURSE.md` front matter (`course_name`, `org`, `repo_url`, paths).
4. Rewrite `README.md` outline sections (keep the section order).
5. Replace the example unit:
   - `lessons/01-example-topic/` → your first lesson
   - `exercises/01-example-topic/` → matching exercise (`NN-slug` must match)
6. Put supporting files only under `other/` (assets, datasets, slides, docs, reference, scripts).
7. Run `bash other/scripts/check_structure.sh` before opening a PR.

## Naming conventions

| Item | Rule |
|------|------|
| Unit folders | `NN-slug` — two digits + lowercase hyphenated ASCII (`01-star-schema`) |
| Lesson files | `lessons/NN-slug/README.md` + `LESSON.md` |
| Exercise files | `exercises/NN-slug/README.md` + `LAB.md` + `starter/` + `solution/` |
| Layout | Keep `lessons/` and `exercises/` **separate** (do not co-locate LESSON + LAB in one folder) |
| Prose language | Thai and/or English in body text |
| Paths / slugs | ASCII only under `lessons/` and `exercises/`; Thai filenames OK under `other/` |

## Do not

- Invent alternate top-level trees (`modules/`, `day-1/`, `Module_01_…`, `labs/`) for new courses.
- Put org-specific structure differences in the folder tree — only in content and `org/` notes.
- Sync this template into `DataFabric-Academy/course-template` unless explicitly requested later.
- Commit secrets, personal working folders, or large binary decks unless the course explicitly needs them (prefer a pointer in `other/slides/README.md`).

## Structure check in CI

Copy `other/scripts/structure-check.workflow.yml` to `.github/workflows/structure-check.yml`.
