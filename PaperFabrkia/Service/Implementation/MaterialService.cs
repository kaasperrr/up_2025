using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using PaperFabrkia.Converters;
using PaperFabrkia.DTO;
using PaperFabrkia.Entities;
using PaperFabrkia.Repiository.Interface;
using PaperFabrkia.Service.Interface;

namespace PaperFabrkia.Service.Implementation
{
    public class MaterialService : IMaterialService
    {
        private readonly IMaterialRepository _materialRepository;

        public MaterialService(IMaterialRepository materialRepository)
        {
            _materialRepository = materialRepository;
        }

        public async Task<MaterialDTO> CreateMaterialAsync(MaterialDTO material)
        {
            var materialNew = new Material {
                NameMaterial = material.NameMaterial,
                Image = material.Image,
                Ostatok = material.Ostatok,
                Cena = material.Cena,
                IdType = material.IdType,
                Opisanie = material.Opisanie,
                EdIsmer = material.EdIsmer,
                KolNaSklade = material.KolNaSklade,
                KolVUpakovke = material.KolVUpakovke

            };
            var createdUser = await _materialRepository.CreateMaterialAsync(materialNew);
            return ConvertToMaterialDTO.Convert(createdUser);
        }

        public async Task<MaterialDTO> GetMaterialByIdAsync(int id)
        {
            var material = await _materialRepository.GetMaterialByIdAsync(id);
            if (material == null)
            {
                throw new Exception("материал не найден");
            }
            return ConvertToMaterialDTO.Convert(material);
        }

        public async Task<MaterialDTO> GetMaterialByNameAsync(string name)
        {
            var material = await _materialRepository.GetMaterialByNameAsync(name);
            if (material == null)
            {
                throw new Exception("материал не найден");
            }
            return ConvertToMaterialDTO.Convert(material);
        }

        public async Task<List<MaterialDTO>> GetAllMaterialsAsync()
        {
            var materials = await _materialRepository.GetAllMaterialsAsync();
            return materials.Select(m => ConvertToMaterialDTO.Convert(m)).ToList();
        }
    }
}
