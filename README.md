# eLearning Platform

This project is an **eLearning Platform** that provides a comprehensive system for students, faculties, and administrators. The platform allows students to register, view available courses, enroll, submit assignments, and track their grades. Faculties can manage course materials, assignments, and grades. It uses SQL for database management to efficiently handle data related to students, courses, enrollments, assignments, submissions, and more.

## Key Features
- **Student Registration**: Secure registration and login system for students and faculty.
- **Available Course List**: Students can browse and enroll in available courses based on their preferences.
- **Enrollments**: Track student enrollment and course participation.
- **Assignment Management**: Faculty can create and assign homework or projects. Students can submit their work through the platform.
- **Submission Tracking**: Monitor deadlines, track assignment submissions, and notify students of upcoming dues.
- **Questions and Answers**: A system for submitting course-related questions and answers to facilitate communication between students and instructors.
- **Grading System**: Faculty can grade assignments, and students can view their grades and progress.
- **Faculty Management**: Faculty can manage their courses, assignments, and students' grades.
  
## Applications
- **Online Learning** for schools, universities, or corporate training.
- **Skill-building Platforms** offering courses on various topics (programming, design, etc.).
- **Educational Management Systems** for automating the learning process for both students and faculty.

## Technologies Used
- **SQL (Structured Query Language)** for relational data management.
- **Python** (or PHP) for backend logic.
- **HTML, CSS, JavaScript** for frontend interface.
- **Flask/Django** (or PHP frameworks) for the web interface.
- **MySQL/PostgreSQL/SQLite** for the database.
  
## Database Structure
1. **Users Table**: Stores user information (students, faculty, admin) such as ID, username, password, email, role.
2. **Courses Table**: Stores course details like course ID, title, description, faculty in charge, and schedule.
3. **Enrollments Table**: Tracks which students are enrolled in which courses.
4. **Assignments Table**: Contains assignment information such as assignment title, description, course, and due date.
5. **Submissions Table**: Tracks student submissions for assignments, along with submission date and time.
6. **Questions and Answers Table**: Logs questions submitted by students and answers from faculty.
7. **Grades Table**: Stores grades assigned to students for their submissions.
8. **Faculties Table**: Stores faculty information, including the courses they manage.

## How it Works
1. **Student Registration and Login**: Students and faculty can register or log in using a secure authentication system. Roles (student, faculty, admin) are assigned accordingly.
2. **Course Listing and Enrollment**: Students can view available courses and enroll. The course information is fetched from the **Courses Table**.
3. **Assignment Management**: Faculty can upload assignments with deadlines, which are visible to enrolled students.
4. **Submissions**: Students can submit their assignments through the platform, and the submissions are stored in the **Submissions Table**.
5. **Dues Management**: Upcoming assignment deadlines (dues) are displayed on the dashboard.
6. **Questions and Answers**: Students can post questions to instructors, and responses are tracked.
7. **Grading and Feedback**: Faculty can grade assignments and provide feedback, which is visible to students.
8. **Progress Tracking**: Students can view their current progress in each course, including grades and pending submissions.
   


