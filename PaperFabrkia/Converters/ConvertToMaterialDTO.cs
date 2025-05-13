using PaperFabrkia.DTO;
using PaperFabrkia.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PaperFabrkia.Converters
{
    public class ConvertToMaterialDTO
    {
        public static MaterialDTO Convert(Material entity) {
            return new MaterialDTO
            {
        NameMaterial = entity.NameMaterial,
                Image  =entity.Image,
                Ostatok  = entity.Ostatok,
                Cena  =entity.Cena,
                IdType = entity.IdType,
                Opisanie = entity.Opisanie,
                EdIsmer = entity.EdIsmer,
                KolNaSklade = entity.KolNaSklade,
                KolVUpakovke = entity.KolVUpakovke
    };
        }
    }
}
