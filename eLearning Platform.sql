create database pr;
use pr;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Role ENUM('student', 'instructor', 'admin') NOT NULL
);
 desc Users;


CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);
desc categories;


CREATE TABLE Instructors (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Bio TEXT,
    Specialization VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
desc Instructors;


CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description TEXT NOT NULL,
    CategoryID INT,
    InstructorID INT,
    StartDate DATE,
    EndDate DATE,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);
desc courses;


CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
desc Enrollments;


CREATE TABLE Assignments (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT,
    Title VARCHAR(255) NOT NULL,
    Description TEXT NOT NULL,
    DueDate DATE NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
desc Assignments;


CREATE TABLE Submissions (
    SubmissionID INT AUTO_INCREMENT PRIMARY KEY,
    AssignmentID INT,
    UserID INT,
    SubmittedOn DATE NOT NULL,
    Grade DECIMAL(5,2),
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
desc Submissions;


CREATE TABLE Quizzes (
    QuizID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT,
    Title VARCHAR(255) NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
desc Quizzes;


CREATE TABLE Questions (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    QuizID INT,
    QuestionText TEXT NOT NULL,
    CorrectAnswer VARCHAR(255) NOT NULL,
    FOREIGN KEY (QuizID) REFERENCES Quizzes(QuizID)
);
desc Questions;


CREATE TABLE Answers (
    AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    QuestionID INT,
    UserID INT,
    AnswerText VARCHAR(255) NOT NULL,
    IsCorrect BOOLEAN,
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
desc Answers;



INSERT INTO Users (UserID, Username, Email, Password, Role) VALUES
(1, 'JoshnaD', 'joshna.doe@example.com', 'password1', 'student'),
(2, 'JayS', 'jay.shah@example.com', 'password2', 'instructor'),
(3, 'MaheshB', 'mahesh.b@example.com', 'password3', 'student'),
(4, 'LakshL', 'laksh.l@example.com', 'password4', 'student'),
(5, 'SeemaW', 'seema.w@example.com', 'password5', 'instructor'),
(6, 'OliviaT', 'olivia.t@example.com', 'password6', 'instructor'),
(7, 'SohaB', 'soha.b@example.com', 'password7', 'student'),
(8, 'MukulD', 'mukul.d@example.com', 'password8', 'instructor'),
(9, 'LailaJ', 'laila.j@example.com', 'password9', 'student'),
(10, 'JiaK', 'jia.k@example.com', 'password10', 'instructor'),
(11, 'JaneD', 'janedoe@example.com', 'password11', 'instructor'),
(12, 'AlexJ', 'alexjohnson@example.com', 'password12', 'instructor'),
(13, 'EmmaW', 'emmawilson@example.com', 'password13', 'instructor'),
(14, 'TejaswiniB', 'tejaswinibose@example.com', 'password14', 'instructor'),
(15, 'RoseT', 'rosetalvar@example.com', 'password15', 'instructor');

select * from users;


INSERT INTO Categories (CategoryID, Name, Description) VALUES
(1, 'Mathematics', 'Courses covering a variety of mathematical topics'),
(2, 'Science', 'Natural and physical sciences'),
(3, 'Humanities', 'Study of human society and culture'),
(4, 'Engineering', 'Application of mathematics and science to create technology'),
(5, 'Art', 'Creative and visual arts courses'),
(6, 'Computer Science', 'Programming and technology courses'),
(7, 'Business', 'Courses on business management and entrepreneurship'),
(8, 'Language', 'Language learning and linguistics'),
(9, 'Music', 'Music performance and theory'),
(10, 'Health', 'Health sciences and personal well-being');

select * from categories;


INSERT INTO Instructors (UserID, Bio, Specialization) VALUES
(2, 'Expert in modern art techniques', 'Art'),
(5, 'Senior software developer with 10 years of experience', 'Computer Science'),
(6, 'Master of Business Administration with a focus on entrepreneurship', 'Business'),
(8, 'Certified public health specialist', 'Health'),
(10, 'Professional musician and composer', 'Music'),
(11, 'Experienced mechanical engineer', 'Engineering'),
(12, 'Ph.D. in linguistics, specializing in romance languages', 'Language'),
(13, 'Mathematician focused on algebra and calculus', 'Mathematics'),
(14, 'Biologist with a focus on genetics', 'Science'),
(15, 'Historian specializing in European history', 'Humanities');

select * from Instructors;


INSERT INTO Courses (CourseID, Title, Description, CategoryID, InstructorID, StartDate, EndDate, Price) VALUES
(1, 'Introduction to Programming', 'Learn the basics of programming', 6, 12, '2024-01-10', '2024-04-10', 200.00),
(2, 'Advanced Painting Techniques', 'Improve your painting skills', 5, 11, '2024-02-15', '2024-05-15', 150.00),
(3, 'Entrepreneurship 101', 'Starting your own business', 7, 13, '2024-03-01', '2024-06-01', 250.00),
(4, 'The World of Music Theory', 'Understanding music theory', 9, 15, '2024-01-20', '2024-04-20', 180.00),
(5, 'Web Development Fundamentals', 'An introduction to the basics of web development', 6, 12, '2024-03-15', '2024-06-15', 300.00),
(6, 'Modern Business Strategies', 'Explore advanced strategies for modern business success', 7, 13, '2024-04-01', '2024-07-01', 350.00),
(7, 'Elementary French', 'Beginner level French course', 8, 17, '2024-01-10', '2024-04-10', 220.00),
(8, 'Introduction to Genetics', 'Basics of genetics and heredity', 2, 19, '2024-02-20', '2024-05-20', 250.00),
(9, 'Classical Music Appreciation', 'Understanding the depth of classical music', 9, 15, '2024-03-01', '2024-06-01', 180.00),
(10, 'Digital Art for Beginners', 'Starting your journey in digital art creation', 5, 11, '2024-04-05', '2024-07-05', 150.00),
(11, 'Principles of Mechanical Engineering', 'An introduction to mechanical engineering principles', 4, 16, '2024-02-15', '2024-05-15', 400.00),
(12, 'Philosophy: An Introduction', 'Exploring the fundamental questions of existence', 3, 20, '2024-03-10', '2024-06-10', 210.00),
(13, 'Basic Algebra', 'Foundational algebra concepts and techniques', 1, 18, '2024-01-15', '2024-04-15', 200.00);

select * from courses;


INSERT INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES
(101, 1, 1, '2024-01-11'),
(102, 3, 5, '2024-01-12'),
(103, 4, 2, '2024-02-16'),
(104, 7, 3, '2024-03-02'),
(105, 9, 7, '2024-03-03');

select * from Enrollments;


INSERT INTO Assignments (AssignmentID, CourseID, Title, Description, DueDate) VALUES
(01, 1, 'Hello World Program', 'Create a simple program that prints Hello World.', '2024-02-01'),
(02, 2, 'Paint a Landscape', 'Paint a landscape using the techniques learned.', '2024-03-01'),
(03, 3, 'Business Plan Draft', 'Draft a business plan for your hypothetical company.', '2024-04-01'),
(04, 1, 'Simple Calculator', 'Develop a simple calculator program.', '2024-02-15'),
(05, 2, 'Portrait Painting', 'Paint a human portrait.', '2024-03-15'),
(06, 3, 'Market Analysis', 'Perform a market analysis for your business plan.', '2024-04-15'),
(07, 1, 'Data Types', 'Explain and demonstrate different data types in programming.', '2024-02-08'),
(08, 2, 'Abstract Art', 'Create a piece of abstract art.', '2024-03-08'),
(09, 3, 'Elevator Pitch', 'Prepare an elevator pitch for your business.', '2024-04-08'),
(10, 1, 'Control Structures', 'Demonstrate the use of control structures in programming.', '2024-02-22');

select * from Assignments;


INSERT INTO Submissions (SubmissionID, AssignmentID, UserID, SubmittedOn, Grade) VALUES
(000, 1, 1, '2024-02-01', 95.00),
(101, 2, 4, '2024-03-01', 88.00),
(102, 3, 7, '2024-04-01', 92.00),
(103, 4, 3, '2024-02-15', 85.00),
(104, 5, 8, '2024-03-15', 78.00),
(105, 6, 8, '2024-04-15', 80.00),
(106, 7, 3, '2024-02-08', 88.00),
(107, 8, 4, '2024-03-08', 90.00),
(108, 9, 7, '2024-04-08', 85.00),
(109, 10, 3, '2024-02-22', 93.00);

select * from submissions;


INSERT INTO Quizzes (QuizID, CourseID, Title) VALUES
(201, 1, 'Basics of Programming'),
(202, 2, 'Art Techniques'),
(203, 3, 'Business Fundamentals'),
(204, 1, 'Programming Logic'),
(205, 2, 'Understanding Colors'),
(206, 3, 'Entrepreneurial Mindset'),
(207, 1, 'Data Structures'),
(208, 2, 'History of Art'),
(209, 3, 'Marketing 101'),
(210, 1, 'Algorithms');

select * from quizzes;


INSERT INTO Questions (QuestionID, QuizID, QuestionText, CorrectAnswer) VALUES
(1, 201, 'What is a variable?', 'A storage location and an associated symbolic name which contains some known or unknown quantity or information, a value.'),
(2, 202, 'What does the color blue represent in art?', 'Calmness and serenity'),
(3, 203, 'What is the primary purpose of a business plan?', 'To outline your business goals and the strategy for achieving them'),
(4, 204, 'What is a function in programming?', 'A block of organized, reusable code that is used to perform a single, related action.'),
(5, 205, 'What principle does the color theory follow?', 'It explains how humans perceive color; and the visual effects of how colors mix, match or contrast with each other.'),
(6, 206, 'What defines an entrepreneurial mindset?', 'A specific state of mind which orientates human conduct towards entrepreneurial activities and outcomes'),
(7, 207, 'What is a data structure?', 'A data organization, management, and storage format that enables efficient access and modification.'),
(8, 208, 'Who is considered the father of modern art?', 'Paul Cézanne'),
(9, 209, 'What is market segmentation?', 'The process of dividing a target market into smaller, more defined categories.'),
(10, 210, 'What algorithmic concept is essential for sorting operations?', 'Comparison');

select * from Questions;


INSERT INTO Answers (AnswerID, QuestionID, UserID, AnswerText, IsCorrect) VALUES
(1, 1, 1, 'A name given to a data storage area that our programs can manipulate.', TRUE),
(2, 2, 4, 'Peace and tranquility.', FALSE),
(3, 3, 7, 'To secure funding from investors.', FALSE),
(4, 4, 3, 'A sequence of instructions that perform a specific task.', TRUE),
(5, 5, 1, 'A rule that dictates the outcome of mixing different colors.', TRUE),
(6, 6, 9, 'A way of thinking that captures opportunity.', TRUE),
(7, 7, 1, 'A collection of data values, the relationships among them, and the functions or operations that can be applied to the data.', TRUE),
(8, 8, 4, 'Vincent Van Gogh.', FALSE),
(9, 9, 7, 'The act of dividing a broad consumer or business market.', TRUE),
(10, 10, 3, 'The loop structure.', FALSE);

select * from Answers;

