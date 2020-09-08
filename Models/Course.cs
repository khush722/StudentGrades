using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace StudentGrades.Models
{
    // Model Class for Course
    public class Course
    {
        //PK->Course annotation
        [Key]
        public int CourseId { get; set; }
        // course name
        public string CourseName { get; set; }
        // FK->Teacher
        [ForeignKey("Teacher")]
        public int TeacherId { get; set; }
        public Teacher Teacher { get; set; }
        // For makeing relationship between course and grade
        public List<Grade> Grade { get; set; }
        // initialization of list inside ctr
        public Course() { Grade = new List<Grade>(); }
    }
}
