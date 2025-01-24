# Manga Reading Site Database

## Project Overview
This project aims to design and implement a comprehensive database for a manga reading site. The database supports features like user management, manga categorization, tracking translations, and storing chapter details. It provides functionality to manage authors, translators, readers, genres, and their relationships with manga titles.

---

## Database Structure

### Tables
1. **AUTHOR**: Stores information about manga authors.
   - **Fields**: `author_id`, `first_name`, `last_name`, `info`

2. **MANGA_TYPE**: Categorizes manga into types (e.g., Shonen, Seinen).
   - **Fields**: `manga_type`, `info`

3. **MANGA**: Holds details about manga titles.
   - **Fields**: `manga_id`, `title`, `author_id`, `translator_id`, `manga_type`, `genre`, `manga_status`, `translation_status`, `chapters_number`, etc.

4. **CHAPTER**: Tracks individual chapters of manga.
   - **Fields**: `chapter_id`, `manga_id`, `title`, `page_count`

5. **TRANSLATOR**: Stores information about translators.
   - **Fields**: `translator_id`, `first_name`, `last_name`, `info`

6. **READER**: Manages registered users on the site.
   - **Fields**: `reader_id`, `nickname`, `email_address`, `password`

7. **GENRE**: Categorizes manga by genre (e.g., Adventure, Drama).
   - **Fields**: `genre`, `info`

8. **RELATIONSHIP TABLES**:
   - **GENRE_MANGA**: Links genres to manga titles.
   - **READER_MANGA**: Tracks which manga a reader has read.
   - **TRANSLATOR_MANGA**: Links translators to manga titles.

---

## Key Features

### 1. Views
- **Single Table Views**:
  - List of current genres and the count of manga in each genre.
  - Average number of chapters for each manga type.

- **Joins**:
  - Latest manga updates with chapter details and authors.
  - Manga titles with their respective authors and translators.
  - Reader count for each manga.

- **Aggregation**:
  - Status of manga on the site (e.g., completed, ongoing).
  - Number of new readers on specific registration dates.

- **Set Operations**:
  - Last update of ongoing manga chapters.

- **Nested Queries**:
  - Search manga by author name.
  - Search manga by translator name.

### 2. Triggers and Sequences
- **Primary Key Generation**:
  - Auto-generate primary keys for tables like `AUTHOR`, `MANGA`, and `READER` using sequences and triggers.

- **Status Check Trigger**:
  - Automatically updates `translation_status` to `Abandoned` if a manga hasn't been updated in more than 3 months.
