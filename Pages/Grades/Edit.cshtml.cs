using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using StudentGrades.Data;
using StudentGrades.Models;

namespace StudentGrades.Pages.Grades
{
    public class EditModel : PageModel
    {
        private readonly StudentGrades.Data.StudentGradesContext _context;

        public EditModel(StudentGrades.Data.StudentGradesContext context)
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
           ViewData["CourseId"] = new SelectList(_context.Set<Course>(), "CourseId", "CourseId");
           ViewData["StudentId"] = new SelectList(_context.Student, "StudentId", "StudentId");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(Grade).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GradeExists(Grade.GradeId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool GradeExists(int id)
        {
            return _context.Grade.Any(e => e.GradeId == id);
        }
    }
}
