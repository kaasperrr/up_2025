using Microsoft.EntityFrameworkCore;
using PaperFabrkia.Entities;
using PaperFabrkia.Repiository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PaperFabrkia.Repiository.Implementation
{
    public class MaterialRepository : IMaterialRepository
    {
        private readonly Pm04Isp33BsvContext _context;

        public MaterialRepository(Pm04Isp33BsvContext context)
        {
            _context = context;
        }

        public async Task<Material> GetMaterialByIdAsync(int id)
        {
            return await _context.Materials
                .Include(m => m.IdTypeNavigation)
                .AsSplitQuery()
                .FirstOrDefaultAsync(m => m.IdMaterial == id);

        }

        public async Task<Material> GetMaterialByNameAsync(string name)
        {
            return await _context.Materials
                .Include(m => m.IdTypeNavigation)
                .AsSplitQuery()
                .FirstOrDefaultAsync(m => m.NameMaterial == name);
        }

        public async Task<Material> CreateMaterialAsync(Material entity)
        {
            var result = await _context.Materials.AddAsync(entity);
            await _context.SaveChangesAsync();
            return result.Entity;

        }


        public async Task<List<Material>> GetAllMaterialsAsync()
        {
            return await _context.Materials
                .Include(m => m.IdTypeNavigation)
                .AsSplitQuery()
                .ToListAsync();

        }
    }
}
