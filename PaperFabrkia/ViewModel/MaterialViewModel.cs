using PaperFabrkia.DTO;
using PaperFabrkia.Service.Interface;
using PaperFabrkia.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PaperFabrkia.ViewModel
{
    public class MaterialViewModel : BaseViewModel
    {
        private readonly IMaterialService _materialService;
        private List<MaterialDTO> _allMaterials;
        private List<MaterialDTO> _materials;
        private string _searchText = string.Empty;
        private string _sortField = "Название";
        private string _sortDirection = "По возрастанию";

        public List<MaterialDTO> Materials
        {
            get => _materials;
            set => SetProperty(ref _materials, value);
        }

        public string SearchText
        {
            get => _searchText;
            set
            {
                SetProperty(ref _searchText, value);
                UpdateMaterials();
            }
        }

        public string SortField
        {
            get => _sortField;
            set
            {
                SetProperty(ref _sortField, value);
                UpdateMaterials();
            }
        }

        public string SortDirection
        {
            get => _sortDirection;
            set
            {
                SetProperty(ref _sortDirection, value);
                UpdateMaterials();
            }
        }

        public List<string> SortFields { get; } = new List<string>
        {
            "Название", "Цена", "Остаток"
        };

        public List<string> SortOptions { get; } = new List<string>
        {
            "По возрастанию", "По убыванию"
        };

        public MaterialViewModel(IMaterialService materialService)
        {
            _materialService = materialService;
            LoadMaterials();
        }

        private async void LoadMaterials()
        {
            _allMaterials = await _materialService.GetAllMaterialsAsync();
            UpdateMaterials();
        }

        private void UpdateMaterials()
        {
            var filtered = string.IsNullOrWhiteSpace(SearchText)
                ? _allMaterials
                : _allMaterials.Where(m => m.NameMaterial.Contains(SearchText, StringComparison.OrdinalIgnoreCase)).ToList();

            switch (SortField)
            {
                case "Название":
                    if (SortDirection == "По возрастанию")
                        filtered = filtered.OrderBy(m => m.NameMaterial).ToList();
                    else
                        filtered = filtered.OrderByDescending(m => m.NameMaterial).ToList();
                    break;

                case "Цена":
                    if (SortDirection == "По возрастанию")
                        filtered = filtered.OrderBy(m => m.Cena ?? 0).ToList(); 
                    else
                        filtered = filtered.OrderByDescending(m => m.Cena ?? 0).ToList();
                    break;

                case "Остаток":
                    if (SortDirection == "По возрастанию")
                        filtered = filtered.OrderBy(m => m.Ostatok ?? 0).ToList();
                    else
                        filtered = filtered.OrderByDescending(m => m.Ostatok ?? 0).ToList();
                    break;
            }

            Materials = filtered;
        }
    }
}


