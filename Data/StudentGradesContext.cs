using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using StudentGrades.Models;

namespace StudentGrades.Data
{
    // Student Database context class
    public class StudentGradesContext : DbContext
    {
        public StudentGradesContext (DbContextOptions<StudentGradesContext> options)
            : base(options)
        {
        }
        // Student Records Set
        public DbSet<StudentGrades.Models.Student> Student { get; set; }
        // Grade Records Set
        public DbSet<StudentGrades.Models.Grade> Grade { get; set; }
        // Course Records Set
        public DbSet<StudentGrades.Models.Course> Course { get; set; }
        // Teacher Records Set
        public DbSet<StudentGrades.Models.Teacher> Teacher { get; set; }
    }
}
