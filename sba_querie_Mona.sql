/** Step 3:  Apply the Alter statements **/
-- A
ALTER TABLE  StudentCourse
ADD  EndDate Date;

ALTER TABLE  StudentCourse
ADD Credits  INT;

--B
ALTER TABLE  StudentCourse
Modify EndDate datatype NOT NULL;

--C
ALTER TABLE  StudentCourse
Rename COLUMN EndDate to FinishDate;

--D
ALTER TABLE StudentCourse
DROP COLUMN FinishDate;

ALTER TABLE StudentCourse
DROP COLUMN Credits;

/** Step 4:  Write queries that return the following result set **/
--A
Select Department.Name As "Department Name", Count(Course.DeptID) AS "# Courses"
From Department
    Inner Join Course
    On Department.ID = Course.DeptID
Group By Department.Name
Order By "# Courses";

--B
Select Course.Name AS "Course Name", Count(StudentID) AS "# Students"
From StudentCourse
    Inner Join Course
    On StudentCourse.CourseID = Course.ID
Group By Course.Name
Order By "# Students" DESC,
          "Course Name" ASC;
          
--C1
Select Course.Name
From Course
Where Course.ID Not In (
      Select CourseID
      From FacultyCourse
      Group By CourseID)
Order By Course.Name ASC;
      
--C2
Select Course.Name, Count(StudentCourse.StudentID) AS "# of students"
From Course
    Inner Join StudentCourse
    On Course.ID = StudentCourse.CourseID
Where Course.ID Not In (
      Select CourseID
      From FacultyCourse
      Group By CourseID)
Group By Course.Name
Order By "# of students" DESC, Course.Name ASC;

--D
Select Count(StudentID) AS "Students", To_Char(StartDate, 'YYYY') AS "Year"
From StudentCourse
Group By StartDate
Order By StartDate ASC;

--E
Select StartDate, Count(StudentID) AS "# Of Students"
From StudentCourse
Group By StartDate
Having StartDate like '%AUG%'
Order By StartDate ASC;

--F
Select Student.FirstName AS "First Name", Student.LastName AS "Last Name", Count(StudentCourse.STUDENTID) AS "Number of Courses"
From StudentCourse
    Inner Join Course
    On StudentCourse.COURSEID = Course.ID
    Inner Join Student
    On StudentCourse.STUDENTID = Student.ID
Where Student.MajorID = Course.DeptID
Group By Student.FirstName, Student.LastName
Order By "Number of Courses" ASC, 
        "Last Name" ASC;


--G
Select Student.FirstName AS "First Name", Student.LastName AS "Last Name", Round(Avg(StudentCourse.Progress),1) AS "Average Progress"
From Student
    Inner Join StudentCourse
    On Student.ID = StudentCourse.STUDENTID
Group By Student.FirstName, Student.LastName
Having Avg(StudentCourse.Progress) < 50
Order By "Average Progress" DESC;

--H1
Select Course.Name AS "Course Name", Avg(StudentCourse.Progress) AS "Average Progress"
From Course
    Inner Join StudentCourse
    On Course.ID = StudentCourse.COURSEID
Group By Course.Name
Order By "Average Progress" DESC;


--H2
Select "Average Progress"
From (
      Select Course.Name AS "Course Name",Avg(StudentCourse.Progress) AS "Average Progress"
      From Course
          Inner Join StudentCourse
          On Course.ID = StudentCourse.COURSEID
      Group By Course.Name
      Order By "Average Progress" DESC)
Where ROWNUM = 1;

--H3
Select Faculty.FirstName AS "First Name", Faculty.LastName AS "Last Name", Avg(StudentCourse.Progress) AS "Avg. Progress"
From Faculty
    Inner Join FacultyCOURSE
    On Faculty.ID = FacultyCOURSE.FACULTYID
    Inner Join StudentCourse
    On FacultyCOURSE.COURSEID = StudentCourse.COURSEID
Group By Faculty.FirstName, Faculty.LastName
Order By "Avg. Progress" ASC;

--H4
Select Faculty.FirstName AS "First Name", Faculty.LastName AS "Last Name", Avg(StudentCourse.Progress) AS "Avg. Progress"
From Faculty
    Inner Join FacultyCOURSE
    On Faculty.ID = FacultyCOURSE.FACULTYID
    Inner Join StudentCourse
    On FacultyCOURSE.COURSEID = StudentCourse.COURSEID
Group By Faculty.FirstName, Faculty.LastName
Having Avg(StudentCourse.Progress) > 0.9 *(Avg(StudentCourse.Progress))
Order By "Avg. Progress" DESC;

--I
Select Student.FirstName AS "First Name", Student.LastName AS "Last Name", 
    (Case
        When Min(StudentCourse.Progress) < 40 Then 'F'
        When Min(StudentCourse.Progress) < 50 Then 'D'
        When Min(StudentCourse.Progress) < 60 Then 'C'
        When Min(StudentCourse.Progress) < 70 Then 'B'
        When Min(StudentCourse.Progress) >= 70 Then 'A'
      End) AS "Min Grade",
      (Case
        When Max(StudentCourse.Progress) < 40 Then 'F'
        When Max(StudentCourse.Progress) < 50 Then 'D'
        When Max(StudentCourse.Progress) < 60 Then 'C'
        When Max(StudentCourse.Progress) < 70 Then 'B'
        When Max(StudentCourse.Progress) >= 70 Then 'A'
      End) AS "Max Grade"
From Student
    Inner Join StudentCourse
    On Student.ID = StudentCourse.STUDENTID
Group By Student.FirstName, Student.LastName
Order By Avg(StudentCourse.Progress);

--J
Select Concat(Concat(Student.FirstName, ' '), Student.LastName) AS "Student Name"
From Student
    Inner Join StudentCourse
    On Student.ID = StudentCourse.StudentID
Group By Student.FirstName, Student.LastName
Order By "Student Name" ASC;

