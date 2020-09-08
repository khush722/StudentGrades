using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using StudentGrades.Data;
using StudentGrades.Models;

namespace StudentGrades.Pages.Teachers
{
    public class DetailsModel : PageModel
    {
        private readonly StudentGrades.Data.StudentGradesContext _context;

        public DetailsModel(StudentGrades.Data.StudentGradesContext context)
        {
            _context = context;
        }

        public Teacher Teacher { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Teacher = await _context.Teacher.FirstOrDefaultAsync(m => m.TeacherId == id);

            if (Teacher == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
