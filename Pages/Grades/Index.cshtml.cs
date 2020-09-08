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
    public class IndexModel : PageModel
    {
        private readonly StudentGrades.Data.StudentGradesContext _context;

        public IndexModel(StudentGrades.Data.StudentGradesContext context)
        {
            _context = context;
        }

        public IList<Grade> Grade { get;set; }

        public async Task OnGetAsync()
        {
            Grade = await _context.Grade
                .Include(g => g.Course)
                .Include(g => g.Student).ToListAsync();
        }
    }
}
