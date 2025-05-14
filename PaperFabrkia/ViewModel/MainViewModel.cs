using PaperFabrkia.ViewModel.Base;
using System.Windows.Input;
using CommunityToolkit.Mvvm.Input;
using PaperFabrkia.Pages;

namespace PaperFabrkia.ViewModel
{
    public class MainViewModel : BaseViewModel
    {
        private object _currentPage;

        public object CurrentPage
        {
            get=> _currentPage;
            set => SetProperty(ref _currentPage, value);
        }

        public ICommand ShowMaterialPageCommand { get; }
        public ICommand ShowProviderPageCommand { get; }

        public ICommand ShowCreateMaterialPageCommand { get; }
        public MainViewModel() {
            ShowMaterialPageCommand = new RelayCommand(ShowMaterialPage);
            ShowProviderPageCommand = new RelayCommand(ShowProviderPage);
            ShowCreateMaterialPageCommand  = new RelayCommand(ShowCreateMaterialPage);
        }

        public void ShowMaterialPage()
        {
            CurrentPage = new MaterialPage();
        }

        public void ShowProviderPage()
        {
            CurrentPage = new ProviderPage();
        }

        public void ShowCreateMaterialPage()
        {
            CurrentPage = new CreateMaterialPage();
        }

    }
}
