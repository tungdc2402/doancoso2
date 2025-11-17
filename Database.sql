
-- Online Programming Learning Platform Database

DROP DATABASE IF EXISTS online_learning;
CREATE DATABASE online_learning;
USE online_learning;

-- USERS TABLE
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('student','instructor','admin') DEFAULT 'student',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- COURSES TABLE
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    level ENUM('beginner','intermediate','advanced') NOT NULL,
    price DECIMAL(10,2) DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (instructor_id) REFERENCES users(user_id)
);

-- LESSONS TABLE
CREATE TABLE lessons (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    video_url VARCHAR(255),
    position INT DEFAULT 1,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- ENROLLMENTS TABLE
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- QUIZZES TABLE
CREATE TABLE quizzes (
    quiz_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- QUESTIONS TABLE
CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT NOT NULL,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255),
    option_b VARCHAR(255),
    option_c VARCHAR(255),
    option_d VARCHAR(255),
    correct_answer CHAR(1),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id)
);

