using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Windows.Media.Imaging;
using System.IO;
using System.Windows;

namespace PaperFabrkia.Converters
{
    public class ImageConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is string imagePath && !string.IsNullOrEmpty(imagePath) && File.Exists(imagePath))
            {
                return new BitmapImage(new Uri(imagePath));
            }

            MessageBox.Show(File.Exists("../image/Empty.png").ToString());
            return new Uri("../image/Empty.png");

        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
