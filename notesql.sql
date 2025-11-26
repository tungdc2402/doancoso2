-- 1. Tạo Database
CREATE DATABASE IF NOT EXISTS stem_course_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE stem_course_db;

-- 2. Bảng Users (Học sinh/Giáo viên)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    avatar_url VARCHAR(255),
    role ENUM('student', 'teacher', 'admin') DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 3. Bảng Courses (Khóa học - VD: Toán 12, Lý 11)
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE,
    description TEXT,
    price DECIMAL(10, 2) DEFAULT 0,
    thumbnail_url VARCHAR(255),
    is_published BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 4. Bảng Chapters (Chương/Chuyên đề - VD: Khảo sát hàm số)
CREATE TABLE chapters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    order_index INT DEFAULT 0,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 5. Bảng Lessons (Bài giảng)
-- Đã thêm loại 'document' cho file PDF đề cương
CREATE TABLE lessons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    chapter_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    type ENUM('video', 'text', 'quiz', 'document') NOT NULL, 
    video_url VARCHAR(500), -- Link video bài giảng
    document_url VARCHAR(500), -- Link file PDF/Word (nếu có)
    content LONGTEXT, -- Nội dung bài học (có thể chứa công thức MathJax/LaTeX)
    order_index INT DEFAULT 0,
    is_free BOOLEAN DEFAULT FALSE,
    duration_seconds INT DEFAULT 0,
    FOREIGN KEY (chapter_id) REFERENCES chapters(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 6. Bảng Questions (Ngân hàng câu hỏi trắc nghiệm)
-- Quan trọng: Có thêm image_url cho hình học/đồ thị
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lesson_id INT NOT NULL, -- Gắn vào bài kiểm tra nào
    content LONGTEXT NOT NULL, -- Nội dung câu hỏi (chứa LaTeX công thức toán)
    image_url VARCHAR(500), -- Ảnh minh họa (Hình trụ, Mạch điện...)
    explanation LONGTEXT, -- Lời giải chi tiết hiện ra sau khi làm xong
    difficulty ENUM('easy', 'medium', 'hard') DEFAULT 'medium',
    order_index INT DEFAULT 0,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 7. Bảng Answers (Đáp án A, B, C, D)
CREATE TABLE answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    content TEXT NOT NULL, -- VD: "x = 5" hoặc chứa công thức ảnh
    is_correct BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 8. Bảng Enrollments (Quản lý mua khóa học)
CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('active', 'expired') DEFAULT 'active',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE KEY unique_enrollment (user_id, course_id)
) ENGINE=InnoDB;

-- 9. Bảng Lesson Progress (Tiến độ học)
CREATE TABLE lesson_progress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    lesson_id INT NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    last_watched_position INT DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE,
    UNIQUE KEY unique_lesson_progress (user_id, lesson_id)
) ENGINE=InnoDB;

-- 10. Bảng Quiz Results (Kết quả làm bài trắc nghiệm)
-- Thay thế cho bảng submissions code
CREATE TABLE quiz_results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    lesson_id INT NOT NULL, -- Bài kiểm tra nào
    score FLOAT DEFAULT 0, -- Điểm số (VD: 8.5)
    total_questions INT DEFAULT 0, -- Tổng số câu hỏi
    correct_answers INT DEFAULT 0, -- Số câu đúng
    completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE
) ENGINE=InnoDB;