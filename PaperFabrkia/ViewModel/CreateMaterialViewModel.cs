using CommunityToolkit.Mvvm.Input;
using PaperFabrkia.DTO;
using PaperFabrkia.Service.Interface;
using PaperFabrkia.ViewModel.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace PaperFabrkia.ViewModel
{
    public class CreateMaterialViewModel : BaseViewModel
    {
        private readonly IMaterialService _materialService;

        private string _nameMaterial;
        private string _image;
        private decimal? _ostatok;
        private decimal? _cena;
        private int? _idType;
        private string _opisanie;
        private string _edIsmer;
        private decimal? _kolNaSklade;
        private decimal? _kolVUpakovke;

        private TypeMaterialDTO _selectedType;


        private List<TypeMaterialDTO> _typeMaterial;


        public string NameMaterial
        {
            get => _nameMaterial;
            set => SetProperty(ref _nameMaterial, value);
        }

        public string Image
        {
            get => _image;
            set => SetProperty(ref _image, value);
        }

        public decimal? Ostatok
        {
            get => _ostatok;
            set => SetProperty(ref _ostatok, value);
        }

        public decimal? Cena
        {
            get => _cena;
            set => SetProperty(ref _cena, value);
        }

        public int? IdType
        {
            get => _idType;
            set => SetProperty(ref _idType, value);
        }

        public string Opisanie
        {
            get => _opisanie;
            set => SetProperty(ref _opisanie, value);
        }

        public string EdIsmer
        {
            get => _edIsmer;
            set => SetProperty(ref _edIsmer, value);
        }

        public decimal? KolNaSklade
        {
            get => _kolNaSklade;
            set => SetProperty(ref _kolNaSklade, value);
        }

        public decimal? KolVUpakovke
        {
            get => _kolVUpakovke;
            set => SetProperty(ref _kolVUpakovke, value);
        }

        public TypeMaterialDTO SelectedType
        {
            get => _selectedType;
            set => SetProperty(ref _selectedType, value);
        }

        
        public List<TypeMaterialDTO> TypeMaterial
        {
            get => _typeMaterial;
            set => SetProperty(ref _typeMaterial, value);
        }

        public ICommand SaveMaterialCommand { get; }
        public ICommand OpenImageCommand { get; }
        public CreateMaterialViewModel(IMaterialService materialService)
        {
            _materialService = materialService;

            SaveMaterialCommand = new RelayCommand(SaveMaterial);
            OpenImageCommand = new RelayCommand(OpenImage);

            LoadReferenceData();
        }


        private async void LoadReferenceData()
        {

            TypeMaterial = new List<TypeMaterialDTO>
    {
        new TypeMaterialDTO { IdType = 1, NameType = "Мягкая" },
        new TypeMaterialDTO { IdType = 2, NameType = "Твёрдая" },
        new TypeMaterialDTO { IdType = 3, NameType = "Смешанная" }
    };

           
        }



        private async void SaveMaterial()
        {
            try
            {
                var material = new MaterialDTO
                {
                    NameMaterial = NameMaterial,
                    Image = Image,
                    Ostatok = Ostatok,
                    Cena = Cena,
                    IdType = SelectedType?.IdType,
                    Opisanie = Opisanie,
                    EdIsmer = EdIsmer,
                    KolNaSklade = KolNaSklade,
                    KolVUpakovke = KolVUpakovke
                };

                var result = await _materialService.CreateMaterialAsync(material);

                if (result != null)
                {
                    MessageBox.Show("Материал успешно создан!");
                }
                else
                {
                    MessageBox.Show("Ошибка при создании материала.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Произошла ошибка: {ex.Message}");
            }
        }

        private void OpenImage()
        {
            var openFileDialog = new Microsoft.Win32.OpenFileDialog
            {
                Filter = "Image files (*.png;*.jpeg;*.jpg)|*.png;*.jpeg;*.jpg"
            };

            bool? result = openFileDialog.ShowDialog();

            if (result == true)
            {
                Image = openFileDialog.FileName;
            }
        }

    }
}

