using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace StudentGrades.Models
{
    // Model class for Grade
    public class Grade
    {
        // PK Annotation
        [Key]
        public int GradeId { get; set; }
        // FK -> Student
        [ForeignKey("Student")]
        public int StudentId { get; set; }
        public Student Student { get; set; }
        // FK->Course
        [ForeignKey("Course")]
        public int CourseId { get; set; }
        public Course Course { get; set; }
        // Grade of Student in course
        public string StudentGrade { get; set; }
    }
}
