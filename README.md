## users テーブル

| Column   | Type   | Options     |
| ------   | ------ | ----------- |
| email    | string | null: false    |
| password | string | null: false    |
| name     | text   | null: false    |
| profile  | text   | null: false    |
| position | text   | null: false    |

## prototypes テーブル

| Column     | Type       | Options            |
| ---------- | ---------- | ------------------ |
| title      | string     | null: false        |
| catch_copy | text       | null: false        |
| concept    | text       | null: false        |
| image      |            | ActiveStorageで実装 |
| user       | references |                    |

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

