# <ชื่อคอร์ส / Course name>

> One-line summary of what learners get from this course.

**Org:** choose one — [DataFabric-Academy](org/datafabric-academy.md) (data platform) or [Onto-IQ](org/onto-iq.md) (AI). Structure is the same for both.

## 1. ภาพรวม / Overview
What the course covers and the outcome learners reach.

## 2. เหมาะกับใคร / Audience
Who the course is for and who it is not for.

## 3. สิ่งที่ต้องมีก่อนเรียน / Prerequisites
- Knowledge:
- Software / accounts:
- Hardware:

See [SETUP.md](SETUP.md) for the full environment setup.

## 4. สารบัญบทเรียน / Lesson outline

| # | Lesson | Lesson folder | Lab | Minutes |
|---|--------|---------------|-----|---------|
| 01 | Example topic | [lessons/01-example-topic](lessons/01-example-topic/) | [labs/01-example-topic](labs/01-example-topic/) | 30 |

## 5. วิธีทำแล็บ / How to run the labs
1. Open `labs/NN-<slug>/README.md` for the task overview.
2. Follow `LAB.md`. Work in `starter/`. Do not open `solution/` until you have tried.
3. Compare with `solution/` afterwards.

## 6. สไลด์ / Slide deck
Deck location: see [other/slides/README.md](other/slides/README.md).

## 7. รายละเอียดคอร์ส / Course description (JD)
- Copy in repo: [other/docs/JD.md](other/docs/JD.md)
- Source of truth: Obsidian note path in `jd_source` of [COURSE.md](COURSE.md)

## 8. โครงสร้าง Repository / Repository layout
```text
COURSE.md  README.md  SETUP.md  CONTRIBUTING.md  CHANGELOG.md
lessons/NN-<slug>/     README.md + LESSON.md
labs/NN-<slug>/        README.md + LAB.md + starter/ + solution/
other/                 supporting materials
  assets/  datasets/  slides/  docs/  reference/  scripts/
org/                   org topic-family notes (content scope only)
```

Folder rules are checked by `bash other/scripts/check_structure.sh`.
To run it in CI, copy `other/scripts/structure-check.workflow.yml` to `.github/workflows/structure-check.yml`.

## 9. License / Credits
-
