using System;

namespace WSUniversalLib
{
    public class Calculation
    {
        public static int GetQuantityForProduct(int productType, int materialType, int count, float width, float length)
        {
            if (productType < 1 || productType > 3 ||
                materialType < 1 || materialType > 2 ||
                count <= 0 || width <= 0 || length <= 0)
            {
                return -1;
            }

            double productTypeCoefficient = 0;
            switch (productType)
            {
                case 1:
                    productTypeCoefficient = 1.1;
                    break;
                case 2:
                    productTypeCoefficient = 2.5;
                    break;
                case 3:
                    productTypeCoefficient = 8.43;
                    break;
            }

            double materialDefectRate = 0;
            switch (materialType)
            {
                case 1:
                    materialDefectRate = 0.003;
                    break;
                case 2:
                    materialDefectRate = 0.0012;
                    break;
            }

            double area = width * length;

            double rawMaterial = area * productTypeCoefficient * count;



            double totalRawMaterial = rawMaterial / (1 - materialDefectRate);

            return (int)Math.Ceiling(totalRawMaterial);
        }
    }
}