using PaperFabrkia.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PaperFabrkia.Repiository.Interface
{
    public interface IMaterialRepository
    {
        Task<Material> CreateMaterialAsync(Material entity);
        Task<Material> GetMaterialByNameAsync(string name);

        Task<Material> GetMaterialByIdAsync(int id);

        Task<List<Material>> GetAllMaterialsAsync();

    }
}
