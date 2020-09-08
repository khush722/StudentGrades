using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StudentGrades.Models
{
    // Model class for Teacher
    public class Teacher
    {
        // PK for Teacher
        // Key Data annoation for PK
        [Key]
        public int TeacherId { get; set; }
        // Name of the Teacher
        public string Name { get; set; }
        // For making fk relationship with course table
        public List<Course> Course { get; set; }
        // ctr for teacher
        public Teacher()
        {
            // initialization of list
            Course = new List<Course>();
        }
    }
}
