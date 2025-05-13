using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PaperFabrkia.DTO
{
    public class MaterialDTO
    {
        public int IdMaterial { get; set; }
        public string? NameMaterial { get; set; }
        public string? Image { get; set; }
        public decimal? Ostatok { get; set; }
        public decimal? Cena { get; set; }
        public int? IdType { get; set; }
        public string? Opisanie { get; set; }
        public string? EdIsmer { get; set; }
        public decimal? KolNaSklade { get; set; }
        public decimal? KolVUpakovke { get; set; }

        
    }
}
