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
using System.Windows.Media.Imaging;

namespace PaperFabrkia.ViewModel
{
    public class EditingViewModel : BaseViewModel
    {
        private readonly IMaterialService _materialService;
        private MaterialDTO _currentMaterial;

        public MaterialDTO CurrentMaterial
        {
            get => _currentMaterial;
            set => SetProperty(ref _currentMaterial, value);
        }

        public List<string> TypeMaterial { get; } = new List<string>
    {
        "Бумага", "Краска", "Обложка", "Клей"
    };

        public string SelectedType { get; set; }

        public ICommand SaveMaterialCommand { get; }
        public ICommand OpenImageCommand { get; }

        public EditingPageViewModel(IMaterialService materialService, int materialId)
        {
            _materialService = materialService;
            SaveMaterialCommand = new RelayCommand(OnSaveMaterial);
            OpenImageCommand = new RelayCommand(OnOpenImage);
            LoadMaterial(materialId);
        }

        private async void LoadMaterial(int materialId)
        {
            CurrentMaterial = await _materialService.GetMaterialByIdAsync(materialId);
            OnPropertyChanged(nameof(CurrentMaterial));
        }

        private async void OnSaveMaterial()
        {
            
            if (CurrentMaterial.Cena < 0 || CurrentMaterial.MinKolVo < 0)
            {
                MessageBox.Show("Цена и минимальное количество не могут быть отрицательными.");
                return;
            }

            await _materialService.UpdateMaterialAsync(CurrentMaterial); 
            MessageBox.Show("Материал успешно сохранен!");
        }

        private void OnOpenImage()
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            if (openFileDialog.ShowDialog() == true)
            {
                var bitmap = new BitmapImage(new Uri(openFileDialog.FileName));
                CurrentMaterial.BitmapImage = bitmap;
                CurrentMaterial.Image = File.ReadAllBytes(openFileDialog.FileName);
            }
        }
    }
}
