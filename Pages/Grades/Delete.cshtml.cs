using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using StudentGrades.Data;
using StudentGrades.Models;

namespace StudentGrades.Pages.Grades
{
    public class DeleteModel : PageModel
    {
        private readonly StudentGrades.Data.StudentGradesContext _context;

        public DeleteModel(StudentGrades.Data.StudentGradesContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Grade Grade { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Grade = await _context.Grade
                .Include(g => g.Course)
                .Include(g => g.Student).FirstOrDefaultAsync(m => m.GradeId == id);

            if (Grade == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Grade = await _context.Grade.FindAsync(id);

            if (Grade != null)
            {
                _context.Grade.Remove(Grade);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
