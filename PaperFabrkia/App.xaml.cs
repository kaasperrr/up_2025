using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using PaperFabrkia.Entities;
using PaperFabrkia.Repiository.Implementation;
using PaperFabrkia.Repiository.Interface;
using PaperFabrkia.Service.Implementation;
using PaperFabrkia.Service.Interface;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace PaperFabrkia
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static IServiceProvider ServiceProvider
        {
            get; private set;
        }

        protected override void OnStartup(StartupEventArgs e)
        {


            var services = new ServiceCollection();
            ConfigureServices(services);

            ServiceProvider = services.BuildServiceProvider();

            base.OnStartup(e);
        }


        private void ConfigureServices(IServiceCollection services)
        {
            services.AddSingleton<IMaterialService, MaterialService>();
            services.AddSingleton<IMaterialRepository, MaterialRepository>();




            services.AddDbContext<Pm04Isp33BsvContext> ();


        } 

    }
}
