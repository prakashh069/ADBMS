CREATE TABLE Course (
    c_number VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL
);

CREATE TABLE Section (
    s_number VARCHAR(10) PRIMARY KEY,
    enrollment INTEGER NOT NULL,
    c_number VARCHAR(10),
    FOREIGN KEY (c_number) REFERENCES Course(c_number) ON DELETE CASCADE
);

CREATE TABLE Dependent (
    c_number VARCHAR(10),
    s_number VARCHAR(10),
    name VARCHAR(100),
    PRIMARY KEY (c_number, s_number),
    FOREIGN KEY (c_number, s_number) REFERENCES Section(c_number, s_number) ON DELETE CASCADE
);

CREATE TABLE Room (
    r_number VARCHAR(10) PRIMARY KEY,
    capacity INTEGER NOT NULL,
    building VARCHAR(50) NOT NULL
);

CREATE TABLE Exam (
    course_name VARCHAR(100),
    section_number VARCHAR(10),
    room_number VARCHAR(10),
    time VARCHAR(50),
    PRIMARY KEY (course_name, section_number),
    FOREIGN KEY (course_name, section_number) REFERENCES Section(c_number, s_number) ON DELETE CASCADE,
    FOREIGN KEY (room_number) REFERENCES Room(r_number) ON DELETE CASCADE
);
