using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StudentGrades.Models
{
    // Student Model
    public class Student
    {
        // PK Annotation EF Core
        [Key]
        public int StudentId { get; set; }
        // Student Name
        public string Name { get; set; }
        // Date of Birth for student
        [DataType(DataType.Date)]
        public DateTime DOB { get; set; }
        // Enrollment Date
        [DataType(DataType.Date)]
        public DateTime EnrollmentDate { get; set; }
        // Student Email
        public string Email { get; set; }
        // check to set if student is topper
        public bool isHonorsStudent { get; set; }
        // Student Password
        public string Password { get; set; }
        // For makeing relationship between student and grade
        public List<Grade> Grade { get; set; }
        // initialization of list object inside ctr
        public Student() { Grade = new List<Grade>(); }
    }
}
