Nouns:
User
Article
Category

Verbs
Create
Edit
See/Display
Add


+---------+       +-------------+         +-------------+
|users    |       |editors      |         |articles     |
+-------+ |       +------+      |         +-------+     |
|id       |*+---+*|id           |*+-----+*|id           |
|username |       |user_id      |         |header       |
|password |       |article_id   |         |body_text    |
|email    |       |updated_at   |         |user_id      |
+---------+       +-------------+         |created_at   |
                                          |updated_at   |
                                          +-------------+
                                              *
                 ------------------------------
                 *
         +-------------------+     +--------------+
         |articles_categories|     |categories    |
         +-------+           |*+-+*+-------+      |
         |article_id         |     |id            |
         |category_id        |     |name          |
         +-------------------+     +--------------+

