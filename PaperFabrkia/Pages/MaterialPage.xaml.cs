using Microsoft.Extensions.DependencyInjection;
using PaperFabrkia.Service.Implementation;
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
    /// Логика взаимодействия для MaterialPage.xaml
    /// </summary>
    public partial class MaterialPage : UserControl
    {
        private readonly IMaterialService _materialService = App.ServiceProvider.GetService<IMaterialService>();
        public MaterialPage()
        {

            InitializeComponent();
            DataContext = new MaterialViewModel(_materialService);

        }
    }
}
