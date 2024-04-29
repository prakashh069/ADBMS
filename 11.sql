CREATE TABLE Course (
    course_number VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL,
    syllabus TEXT,
    prerequisites VARCHAR(10), -- Assuming prerequisites are stored as course numbers
    FOREIGN KEY (prerequisites) REFERENCES Course(course_number) -- Reference to the Course table
);

CREATE TABLE Course_Offering (
    course_number VARCHAR(10),
    year INTEGER,
    semester VARCHAR(10),
    section_number INTEGER,
    instructor VARCHAR(50), -- Assuming instructors are stored as names
    timings VARCHAR(50),
    classroom VARCHAR(50),
    PRIMARY KEY (course_number, year, semester, section_number),
    FOREIGN KEY (course_number) REFERENCES Course(course_number) ON DELETE CASCADE, -- Reference to the Course table
    FOREIGN KEY (instructor) REFERENCES Instructor(name) ON DELETE CASCADE -- Reference to the Instructor table
);

CREATE TABLE Student (
    student_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    program VARCHAR(50) NOT NULL
);

CREATE TABLE Instructor (
    instructor_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    title VARCHAR(50)
);

CREATE TABLE Enrollment (
    student_id VARCHAR(20),
    course_number VARCHAR(10),
    year INTEGER,
    semester VARCHAR(10),
    section_number INTEGER,
    grade VARCHAR(2), -- Assuming grades are stored as letters (e.g., A, B, C)
    PRIMARY KEY (student_id, course_number, year, semester, section_number),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE, -- Reference to the Student table
    FOREIGN KEY (course_number, year, semester, section_number) REFERENCES Course_Offering(course_number, year, semester, section_number) ON DELETE CASCADE -- Reference to the Course_Offering table
);
