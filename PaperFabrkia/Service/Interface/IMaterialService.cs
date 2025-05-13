using PaperFabrkia.DTO;
using PaperFabrkia.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PaperFabrkia.Service.Interface
{
    public interface IMaterialService
    {
        Task<MaterialDTO> CreateMaterialAsync(MaterialDTO entity);
        Task<MaterialDTO> GetMaterialByNameAsync(string name);

        Task<MaterialDTO> GetMaterialByIdAsync(int id);
        Task<List<MaterialDTO>> GetAllMaterialsAsync();
    }
}
