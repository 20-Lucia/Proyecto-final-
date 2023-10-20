CREATE DATABASE proyecto_final;
USE proyecto_final;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255), 
);

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    shared_with_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
    FOREIGN KEY (shared_with_id) REFERENCES users(id) ON DELETE CASCADE
);



INSERT INTO users (name, email, password) VALUES ('Lucia Quintana', 'quintana20@gmail.com', 'Lucia');
INSERT INTO users (name, email, password) VALUES ('Jeisson Leon', 'Leon25@gmail.com', 'Jeisson');

INSERT INTO todos (title, user_id)
VALUES
("🐕Sacar el perro", 1),
("🏋🏻‍♂️Ir al gym", 1),
("🧹Organizar la casa", 1),
("🥗Preparar el almuerzo", 1),
("💻Hacer el proyecto de programación", 1),
("👩🏻‍🏫Ingresar a clases", 1);

INSERT INTO shared_todos (todo_id,user_id,shared_with_id)
VALUES (1,1,2);

SELECT todos.*, shared_todos.shared_with_id
FROM todos
LEFT JOIN shared_todos ON todo_id = shared_todos.todo_id
WHERE todos.user_id = [user_id] OR shared_todos.shared_with_id = [user_id];

