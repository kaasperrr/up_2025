using Microsoft.Extensions.DependencyInjection;
using PaperFabrkia.Service.Interface;
using PaperFabrkia.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PaperFabrkia.Pages
{
    /// <summary>
    /// Логика взаимодействия для CreateMaterialPage.xaml
    /// </summary>
    public partial class CreateMaterialPage : UserControl
    {
        private readonly IMaterialService _materialService = App.ServiceProvider.GetService<IMaterialService>();
        public CreateMaterialPage()
        {
            InitializeComponent();
            DataContext = new CreateMaterialViewModel(_materialService);
    }
    }
}
