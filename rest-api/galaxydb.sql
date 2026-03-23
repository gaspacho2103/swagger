CREATE DATABASE chirpdb;
USE chirpdb;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATE DEFAULT (CURRENT_DATE),
    avatar LONGBLOB NULL,
    description VARCHAR(255) NULL
);

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(255),
    topic VARCHAR(56),
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE pin_files (
    file_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    filename VARCHAR(128) NULL,
    file_format VARCHAR(20) NULL,
    file_data LONGBLOB NULL,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE
);

CREATE TABLE subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    follower_id INT,
    followed_id INT,
    FOREIGN KEY (follower_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (followed_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- INSERT INTO users (username, email, password_hash) VALUES
-- ('alice', 'alice@example.com', 'hashed_password_1'),
-- ('bob', 'bob@example.com', 'hashed_password_2'),
-- ('charlie', 'charlie@example.com', 'hashed_password_3'),
-- ('dave', 'dave@example.com', 'hashed_password_4'),
-- ('eve', 'eve@example.com', 'hashed_password_5');

-- INSERT INTO posts (user_id, title, topic, content) VALUES
-- (1, 'Первый пост', 'Общие', 'Это мой первый пост на платформе!'),
-- (1, 'Второй пост', 'Личное', 'Сегодня отличный день!'),
-- (2, 'Пост Боба', 'Новости', 'Привет всем! Как дела?'),
-- (3, 'Пост Чарли', 'Обсуждение', 'У меня есть интересная новость.'),
-- (4, 'Пост Дейва', 'Интересное', 'Давайте обсудим что-то интересное.'),
-- (5, 'Пост Евы', 'Общие', 'Кто-то хочет поиграть в новые игры?'),
-- (1, 'Третий пост', 'Личное', 'Я только что вернулась с отпуска!'),
-- (2, 'Пост Боба о путешествиях', 'Путешествия', 'Недавно я посетил удивительное место.'),
-- (3, 'Пост Чарли о кино', 'Кино', 'Посмотрел новый фильм, и он потрясающий!'),
-- (4, 'Пост Дейва о музыке', 'Музыка', 'Какую музыку вы слушаете в последнее время?');

-- INSERT INTO pin_files (post_id, filename, f_format) VALUES
-- (1, 'image1.jpg', 'jpg'),
-- (1, 'image2.png', 'png'),
-- (2, 'video1.mp4', 'mp4'),
-- (3, 'document1.pdf', 'pdf'),
-- (2, 'image3.gif', 'gif'),
-- (4, 'audio1.mp3', 'mp3');

-- INSERT INTO subscriptions (follower_id, followed_id) VALUES
-- (1, 2),  -- Алиса подписывается на Боба
-- (1, 3),  -- Алиса подписывается на Чарли
-- (2, 3),  -- Боб подписывается на Чарли
-- (2, 4),  -- Боб подписывается на Дейва
-- (3, 1);  -- Чарли подписывается на Алису

-- INSERT INTO likes (post_id, user_id) VALUES
-- (1, 2),  -- Боб лайкает первый пост Алисы
-- (1, 3),  -- Чарли лайкает первый пост Алисы
-- (2, 1),  -- Алиса лайкает второй пост Алисы
-- (3, 1),  -- Алиса лайкает пост Боба
-- (4, 2);  -- Боб лайкает пост Чарли

-- INSERT INTO comments (post_id, user_id, content) VALUES
-- (1, 2, 'Классный пост!'),  -- Боб комментирует первый пост Алисы
-- (1, 3, 'Согласен, очень интересно!'),  -- Чарли комментирует первый пост Алисы
-- (2, 1, 'Спасибо, Боб!'),  -- Алиса отвечает на комментарий Боба
-- (3, 4, 'Привет, Боб! Как дела?'),  -- Дейв комментирует пост Боба
-- (4, 1, 'Жду подробностей!');  -- Алиса комментирует пост Чарли







