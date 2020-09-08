using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using StudentGrades.Data;
using StudentGrades.Models;

namespace StudentGrades.Pages.Courses
{
    public class DetailsModel : PageModel
    {
        private readonly StudentGrades.Data.StudentGradesContext _context;

        public DetailsModel(StudentGrades.Data.StudentGradesContext context)
        {
            _context = context;
        }

        public Course Course { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Course = await _context.Course
                .Include(c => c.Teacher).FirstOrDefaultAsync(m => m.CourseId == id);

            if (Course == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
